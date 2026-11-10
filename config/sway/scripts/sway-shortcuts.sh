#!/usr/bin/env bash
#
# sway-shortcuts.sh - Display all keyboard shortcuts controlled by Sway
#

set -eo pipefail

SCRIPT_NAME="$(basename "$0")"

# Terminal color defaults
if [[ -t 1 ]]; then
    COLOR_RESET="\033[0m"
    COLOR_BOLD="\033[1m"
    COLOR_DIM="\033[2m"
    COLOR_KEY="\033[1;33m"     # Bold Yellow
    COLOR_MODE="\033[1;35m"    # Bold Magenta
    COLOR_CMD="\033[36m"       # Cyan
    COLOR_HEAD="\033[1;34m"    # Bold Blue
else
    COLOR_RESET=""
    COLOR_BOLD=""
    COLOR_DIM=""
    COLOR_KEY=""
    COLOR_MODE=""
    COLOR_CMD=""
    COLOR_HEAD=""
fi

MODE_FILTER=""
SEARCH_QUERY=""
EXPAND_VARS=1
TRANSLATE_MODS=1
OUTPUT_FORMAT="table"

usage() {
    cat << 'USAGETEXT'
Usage: sway-shortcuts.sh [OPTIONS]

Display all keyboard shortcuts configured in Sway.

Options:
  -m, --mode <name>      Filter shortcuts by mode (e.g. default, resize)
  -s, --search <term>    Search/filter shortcuts matching query (case-insensitive)
  -r, --raw              Show raw shortcuts without variable expansion or Mod translation
  --no-color             Disable colored terminal output
  --fzf                  Interactive fuzzy search with fzf
  --menu, --bemenu       Display shortcuts in bemenu / dmenu popup
  -h, --help             Show this help message

USAGETEXT
    exit 0
}

# Parse command line options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -m|--mode)
            MODE_FILTER="$2"
            shift 2
            ;;
        -s|--search)
            SEARCH_QUERY="$2"
            shift 2
            ;;
        -r|--raw)
            EXPAND_VARS=0
            TRANSLATE_MODS=0
            shift
            ;;
        --no-color)
            COLOR_RESET=""
            COLOR_BOLD=""
            COLOR_DIM=""
            COLOR_KEY=""
            COLOR_MODE=""
            COLOR_CMD=""
            COLOR_HEAD=""
            shift
            ;;
        --fzf)
            OUTPUT_FORMAT="fzf"
            shift
            ;;
        --menu|--bemenu|--dmenu)
            OUTPUT_FORMAT="menu"
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Unknown option: $1" >&2
            echo "Run '$SCRIPT_NAME --help' for usage." >&2
            exit 1
            ;;
    esac
done

# Read file recursively handling 'include <pattern>'
read_config_file() {
    local file="$1"
    [[ -f "$file" ]] || return 0

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Check for include directives
        if [[ "$line" =~ ^[[:space:]]*include[[:space:]]+(.+) ]]; then
            local raw_pattern="${BASH_REMATCH[1]}"
            # Strip quotes if any
            raw_pattern="${raw_pattern%\"}"
            raw_pattern="${raw_pattern#\"}"
            raw_pattern="${raw_pattern%\'}"
            raw_pattern="${raw_pattern#\'}"
            # Expand tilde ~ to $HOME
            raw_pattern="${raw_pattern/#\~/$HOME}"
            # Relative paths in sway are relative to config file directory
            if [[ "$raw_pattern" != /* ]]; then
                local config_dir
                config_dir="$(dirname "$file")"
                raw_pattern="$config_dir/$raw_pattern"
            fi
            # Iterate through matched files
            for inc in $raw_pattern; do
                if [[ -f "$inc" ]]; then
                    read_config_file "$inc"
                fi
            done
        else
            printf "%s\n" "$line"
        fi
    done < "$file"
}

# Fetch Sway configuration:
# 1. Try swaymsg -t get_config (active running configuration)
# 2. Fall back to reading files ($SWAY_CONFIG, ~/.config/sway/config, etc.)
get_sway_config() {
    local config_text=""

    if command -v swaymsg >/dev/null 2>&1; then
        if command -v jq >/dev/null 2>&1; then
            config_text="$(swaymsg -t get_config 2>/dev/null | jq -r '.config // empty' 2>/dev/null || true)"
        elif command -v python3 >/dev/null 2>&1; then
            config_text="$(swaymsg -t get_config 2>/dev/null | python3 -c 'import sys, json; print(json.load(sys.stdin).get("config", ""))' 2>/dev/null || true)"
        fi
    fi

    if [[ -n "$config_text" ]]; then
        printf "%s\n" "$config_text"
        return 0
    fi

    local candidate_files=(
        "${SWAY_CONFIG:-}"
        "${XDG_CONFIG_HOME:-$HOME/.config}/sway/config"
        "$HOME/.sway/config"
        "/etc/sway/config"
    )

    for cfg in "${candidate_files[@]}"; do
        if [[ -n "$cfg" && -f "$cfg" ]]; then
            read_config_file "$cfg"
            return 0
        fi
    done

    echo "Error: Could not retrieve Sway configuration from swaymsg or standard config paths." >&2
    exit 1
}

# Parse and process configuration
declare -A VAR_MAP
CURRENT_MODE="default"

declare -a OUT_MODES
declare -a OUT_KEYS
declare -a OUT_RAWS
declare -a OUT_CMDS

# Read all configuration lines into memory
mapfile -t CONFIG_LINES < <(get_sway_config)

# Pass 1: Collect all variable definitions
for line in "${CONFIG_LINES[@]}"; do
    # Trim leading/trailing whitespace
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"

    [[ -z "$line" || "$line" =~ ^# ]] && continue

    if [[ "$line" =~ ^set[[:space:]]+(\$[A-Za-z0-9_-]+)[[:space:]]+(.+)$ ]]; then
        v_name="${BASH_REMATCH[1]}"
        v_val="${BASH_REMATCH[2]}"
        # Strip trailing inline comments if any
        if [[ "$v_val" =~ ^(.*)[[:space:]]+#.*$ ]]; then
            v_val="${BASH_REMATCH[1]}"
            v_val="${v_val%"${v_val##*[![:space:]]}"}"
        fi
        # Strip surrounding quotes
        v_val="${v_val%\"}"
        v_val="${v_val#\"}"
        v_val="${v_val%\'}"
        v_val="${v_val#\'}"

        VAR_MAP["$v_name"]="$v_val"
    fi
done

# Sort variables by key length descending to prevent prefix replacement collisions (e.g. $ws1 before $ws10)
mapfile -t SORTED_VAR_KEYS < <(for k in "${!VAR_MAP[@]}"; do printf "%s\n" "$k"; done | awk '{ print length, $0 }' | sort -nr | cut -d' ' -f2-)

# Pass 2: Parse mode blocks and key bindings
for line in "${CONFIG_LINES[@]}"; do
    # Trim leading/trailing whitespace
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"

    # Ignore blank lines and comments
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    # Skip variable definitions
    [[ "$line" =~ ^set[[:space:]]+ ]] && continue

    # Mode entry: mode [--pango_markup] "mode_name" {
    if [[ "$line" =~ ^mode[[:space:]]+(--pango_markup[[:space:]]+)?(\"[^\"]+\"|[^[:space:]]+)[[:space:]]*\{ ]]; then
        m_name="${BASH_REMATCH[2]}"
        m_name="${m_name%\"}"
        m_name="${m_name#\"}"
        CURRENT_MODE="$m_name"
        continue
    fi

    # Mode exit: }
    if [[ "$line" == "}" ]]; then
        CURRENT_MODE="default"
        continue
    fi

    # Key binding line: bindsym or bindcode
    if [[ "$line" =~ ^(bindsym|bindcode)[[:space:]]+(.*)$ ]]; then
        bind_type="${BASH_REMATCH[1]}"
        rest="${BASH_REMATCH[2]}"

        # Consume leading flags
        is_pointer_binding=0
        while [[ "$rest" =~ ^--[A-Za-z0-9_-]+(=[^[:space:]]+)? ]]; do
            flag="${rest%% *}"
            rest="${rest#* }"
            rest="${rest#"${rest%%[![:space:]]*}"}"

            if [[ "$flag" =~ ^--(whole-window|border|exclude-titlebar) ]]; then
                is_pointer_binding=1
            fi
        done

        combo="${rest%%[[:space:]]*}"
        cmd="${rest#"$combo"}"
        # Trim leading/trailing whitespace from cmd
        cmd="${cmd#"${cmd%%[![:space:]]*}"}"
        cmd="${cmd%"${cmd##*[![:space:]]}"}"

        # Filter out mouse / pointer events
        if [[ "$is_pointer_binding" -eq 1 ]] || [[ "$combo" =~ (button[0-9]|mouse|scroll_) ]]; then
            continue
        fi

        # Variable expansion
        resolved_combo="$combo"
        resolved_cmd="$cmd"
        if [[ "$EXPAND_VARS" -eq 1 ]]; then
            for v in "${SORTED_VAR_KEYS[@]}"; do
                resolved_combo="${resolved_combo//$v/${VAR_MAP[$v]}}"
                resolved_cmd="${resolved_cmd//$v/${VAR_MAP[$v]}}"
            done
        fi

        # Friendly modifier translation
        display_combo="$resolved_combo"
        if [[ "$TRANSLATE_MODS" -eq 1 ]]; then
            display_combo="${display_combo//Mod1/Alt}"
            display_combo="${display_combo//Mod4/Super}"
            display_combo="${display_combo//Mod2/NumLock}"
            display_combo="${display_combo//Mod5/AltGr}"
            display_combo="${display_combo//Control/Ctrl}"
        fi

        # Filter by mode if specified
        if [[ -n "$MODE_FILTER" && "${CURRENT_MODE,,}" != "${MODE_FILTER,,}" ]]; then
            continue
        fi

        # Filter by search term if specified
        if [[ -n "$SEARCH_QUERY" ]]; then
            combined_text="$CURRENT_MODE $display_combo $combo $resolved_cmd"
            if [[ "${combined_text,,}" != *"${SEARCH_QUERY,,}"* ]]; then
                continue
            fi
        fi

        OUT_MODES+=("$CURRENT_MODE")
        OUT_KEYS+=("$display_combo")
        OUT_RAWS+=("$combo")
        OUT_CMDS+=("$resolved_cmd")
    fi
done

total="${#OUT_KEYS[@]}"
if [[ "$total" -eq 0 ]]; then
    echo "No matching Sway keyboard shortcuts found."
    exit 0
fi

# Render output according to chosen format
case "$OUTPUT_FORMAT" in
    fzf)
        if ! command -v fzf >/dev/null 2>&1; then
            echo "Error: fzf is not installed." >&2
            exit 1
        fi
        for ((i=0; i<total; i++)); do
            printf "[%-7s]  %-26s  -->  %s\n" "${OUT_MODES[i]}" "${OUT_KEYS[i]}" "${OUT_CMDS[i]}"
        done | fzf --prompt="Sway Shortcuts> " --header="Press ESC to close"
        ;;

    menu)
        # Check for available launcher (invoke bemenu directly so it reads stdin, unlike bemenu-run)
        declare -a MENU_CMD=()
        if command -v bemenu >/dev/null 2>&1; then
            font="Ubuntu Mono 12"
            lines=22
            width="0.60"
            border=2
            radius=4

            # Coordinates with ~/.config/sway/scripts/bemenu.sh theme if present
            bemenu_script="$HOME/.config/sway/scripts/bemenu.sh"
            color_bg="#000000"
            color_fg="#ebdbb2"
            color_hl_bg="#458588"
            color_hl_fg="#ebdbb2"
            color_prompt_fg="#fabd2f"
            color_border="#458588"
            color_scroll_bg="#000000"
            color_scroll_fg="#928374"

            if [[ -f "$bemenu_script" ]]; then
                val="$(grep -E '^FONT=' "$bemenu_script" | cut -d'=' -f2- | tr -d '"' | tr -d "'" || true)"
                [[ -n "$val" ]] && font="$val"
                val="$(grep -E '^COLOR_BG=' "$bemenu_script" | cut -d'=' -f2- | tr -d '"' | tr -d "'" || true)"
                [[ -n "$val" ]] && color_bg="$val"
                val="$(grep -E '^COLOR_FG=' "$bemenu_script" | cut -d'=' -f2- | tr -d '"' | tr -d "'" || true)"
                [[ -n "$val" ]] && color_fg="$val"
                val="$(grep -E '^COLOR_HL_BG=' "$bemenu_script" | cut -d'=' -f2- | tr -d '"' | tr -d "'" || true)"
                [[ -n "$val" ]] && color_hl_bg="$val"
                val="$(grep -E '^COLOR_HL_FG=' "$bemenu_script" | cut -d'=' -f2- | tr -d '"' | tr -d "'" || true)"
                [[ -n "$val" ]] && color_hl_fg="$val"
                val="$(grep -E '^COLOR_PROMPT_FG=' "$bemenu_script" | cut -d'=' -f2- | tr -d '"' | tr -d "'" || true)"
                [[ -n "$val" ]] && color_prompt_fg="$val"
                val="$(grep -E '^COLOR_BORDER=' "$bemenu_script" | cut -d'=' -f2- | tr -d '"' | tr -d "'" || true)"
                [[ -n "$val" ]] && color_border="$val"
            fi

            MENU_CMD=(
                bemenu
                --center
                --list "$lines"
                --width-factor "$width"
                --line-height 28
                --border "$border"
                --border-radius "$radius"
                --ignorecase
                --fixed-height
                --scrollbar autohide
                --counter always
                --prompt "Shortcuts:"
                --fn "$font"
                --tb "$color_bg" --tf "$color_prompt_fg"
                --fb "$color_bg" --ff "$color_fg"
                --nb "$color_bg" --nf "$color_fg"
                --hb "$color_hl_bg" --hf "$color_hl_fg"
                --bdr "$color_border"
                --scb "$color_scroll_bg" --scf "$color_scroll_fg"
            )
        elif command -v rofi >/dev/null 2>&1; then
            MENU_CMD=(rofi -dmenu -i -p "Shortcuts" -l 22)
        elif command -v wofi >/dev/null 2>&1; then
            MENU_CMD=(wofi --dmenu -i -p "Shortcuts" --lines 22)
        elif command -v dmenu >/dev/null 2>&1; then
            MENU_CMD=(dmenu -l 22 -p "Shortcuts:" -i)
        fi

        if [[ "${#MENU_CMD[@]}" -eq 0 ]]; then
            echo "Error: No menu tool found (bemenu, rofi, wofi, or dmenu)." >&2
            exit 1
        fi

        selected="$(for ((i=0; i<total; i++)); do
            printf "[%-7s]  %-24s  -->  %s\n" "${OUT_MODES[i]}" "${OUT_KEYS[i]}" "${OUT_CMDS[i]}"
        done | "${MENU_CMD[@]}" || true)"

        if [[ -n "$selected" ]]; then
            echo "$selected"
            if command -v wl-copy >/dev/null 2>&1; then
                printf "%s" "$selected" | wl-copy
            fi
        fi
        ;;

    table|*)
        {
            # Table Header
            printf "%b\t%b\t%b\t%b\n" \
                "${COLOR_HEAD}MODE${COLOR_RESET}" \
                "${COLOR_HEAD}SHORTCUT${COLOR_RESET}" \
                "${COLOR_HEAD}RAW BINDING${COLOR_RESET}" \
                "${COLOR_HEAD}COMMAND${COLOR_RESET}"
            printf "%b\t%b\t%b\t%b\n" \
                "${COLOR_DIM}----${COLOR_RESET}" \
                "${COLOR_DIM}--------${COLOR_RESET}" \
                "${COLOR_DIM}-----------${COLOR_RESET}" \
                "${COLOR_DIM}-------${COLOR_RESET}"

            for ((i=0; i<total; i++)); do
                local_mode="${OUT_MODES[i]}"
                local_key="${OUT_KEYS[i]}"
                local_raw="${OUT_RAWS[i]}"
                local_cmd="${OUT_CMDS[i]}"

                # Color mode differently if not default
                if [[ "$local_mode" != "default" ]]; then
                    m_str="${COLOR_MODE}${local_mode}${COLOR_RESET}"
                else
                    m_str="${local_mode}"
                fi

                printf "%b\t%b\t%b\t%b\n" \
                    "$m_str" \
                    "${COLOR_KEY}${local_key}${COLOR_RESET}" \
                    "${COLOR_DIM}${local_raw}${COLOR_RESET}" \
                    "${COLOR_CMD}${local_cmd}${COLOR_RESET}"
            done
        } | column -t -s $'\t'

        echo
        printf "%b\n" "${COLOR_DIM}Total keyboard shortcuts: ${total}${COLOR_RESET}"
        ;;
esac
