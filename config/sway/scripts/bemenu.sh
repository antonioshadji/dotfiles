#!/usr/bin/env bash
# Bemenu application launcher popup wrapper for Sway

FONT="Ubuntu Mono 12"
LINES=12
WIDTH_FACTOR=0.35
LINE_HEIGHT=28
BORDER=2
BORDER_RADIUS=4

# Color Palette: Option B (Coordinated with Waybar theme)
COLOR_BG="#000000"
COLOR_FG="#ebdbb2"
COLOR_HL_BG="#458588"
COLOR_HL_FG="#ebdbb2"
COLOR_PROMPT_FG="#fabd2f"
COLOR_BORDER="#458588"
COLOR_SCROLL_BG="#000000"
COLOR_SCROLL_FG="#928374"

exec bemenu-run \
    --center \
    --list "$LINES" \
    --width-factor "$WIDTH_FACTOR" \
    --line-height "$LINE_HEIGHT" \
    --border "$BORDER" \
    --border-radius "$BORDER_RADIUS" \
    --ignorecase \
    --fixed-height \
    --scrollbar autohide \
    --counter always \
    --prompt "Run:" \
    --fn "$FONT" \
    --tb "$COLOR_BG" --tf "$COLOR_PROMPT_FG" \
    --fb "$COLOR_BG" --ff "$COLOR_FG" \
    --nb "$COLOR_BG" --nf "$COLOR_FG" \
    --hb "$COLOR_HL_BG" --hf "$COLOR_HL_FG" \
    --bdr "$COLOR_BORDER" \
    --scb "$COLOR_SCROLL_BG" --scf "$COLOR_SCROLL_FG" \
    "$@"
