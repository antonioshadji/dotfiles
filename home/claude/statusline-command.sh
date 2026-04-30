#!/usr/bin/env bash
# Status line script for Claude Code
# Mimics Starship prompt elements

# Read JSON input from stdin
input=$(cat)

# Extract values from JSON
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
home=$HOME

# Replace home directory with ~
display_path="${cwd/#$home/~}"

# Build status line components
output=""

# Directory (cyan bold like Starship config)
output+=$(printf '\033[1;36m%s\033[0m' "$display_path")

# Git branch (if in a git repo)
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null || echo "detached")
    if [ -n "$branch" ]; then
        # Purple bold for git branch
        output+=$(printf ' \033[1;35mon  %s\033[0m' "$branch")

        # Git status indicators (red bold like Starship)
        git_status=$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)
        if [ -n "$git_status" ]; then
            indicators=""
            # Check for various git states
            echo "$git_status" | grep -q "^??" && indicators+="?"
            echo "$git_status" | grep -q "^[AM]" && indicators+="+"
            echo "$git_status" | grep -q "^ [AM]" && indicators+="!"
            echo "$git_status" | grep -q "^D" && indicators+="✘"

            if [ -n "$indicators" ]; then
                output+=$(printf ' \033[1;31m[%s]\033[0m' "$indicators")
            fi
        fi
    fi
fi

# Conda environment (if active)
if [ -n "$CONDA_DEFAULT_ENV" ] && [ "$CONDA_DEFAULT_ENV" != "base" ]; then
    output+=$(printf ' \033[0;33m(🅒 %s)\033[0m' "$CONDA_DEFAULT_ENV")
fi

# Python virtual environment (if active and not conda)
if [ -n "$VIRTUAL_ENV" ] && [ -z "$CONDA_DEFAULT_ENV" ]; then
    venv_name=$(basename "$VIRTUAL_ENV")
    output+=$(printf ' \033[0;33m(🐍 %s)\033[0m' "$venv_name")
fi

# Model name (green)
model_name=$(echo "$input" | jq -r '.model.display_name')
if [ -n "$model_name" ] && [ "$model_name" != "null" ]; then
    output+=$(printf ' \033[0;32m[%s]\033[0m' "$model_name")
fi

# Total cost in USD (yellow)
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens')
if [ "$total_input" != "null" ] && [ "$total_output" != "null" ]; then
    # Pricing per million tokens (as of Jan 2025)
    # Claude 3.5 Sonnet: $3/MTok input, $15/MTok output
    # Claude Opus 4.5: $15/MTok input, $75/MTok output
    # Claude 3.5 Haiku: $1/MTok input, $5/MTok output
    # Claude Opus 4.7	$5.00	$25.00
    # Claude Sonnet 4.6	$3.00	$15.00
    # Claude Haiku 4.5	$1.00	$5.00
    model_id=$(echo "$input" | jq -r '.model.id')

    if echo "$model_id" | grep -q "opus"; then
        input_cost=$(echo "scale=4; $total_input * 5 / 1000000" | bc)
        output_cost=$(echo "scale=4; $total_output * 25 / 1000000" | bc)
    elif echo "$model_id" | grep -q "haiku"; then
        input_cost=$(echo "scale=4; $total_input * 1 / 1000000" | bc)
        output_cost=$(echo "scale=4; $total_output * 5 / 1000000" | bc)
    else
        # Default to Sonnet pricing
        input_cost=$(echo "scale=4; $total_input * 3 / 1000000" | bc)
        output_cost=$(echo "scale=4; $total_output * 15 / 1000000" | bc)
    fi

    total_cost=$(echo "scale=4; $input_cost + $output_cost" | bc)
    output+=$(printf ' \033[0;33m[$%.4f USD]\033[0m' "$total_cost")
fi

# Context window percentage (magenta)
usage=$(echo "$input" | jq '.context_window.current_usage')
if [ "$usage" != "null" ]; then
    current=$(echo "$usage" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
    size=$(echo "$input" | jq '.context_window.context_window_size')
    if [ "$current" != "null" ] && [ "$size" != "null" ] && [ "$size" -gt 0 ]; then
        pct=$((current * 100 / size))
        output+=$(printf ' \033[0;35m[%d%% context]\033[0m' "$pct")
    fi
fi

# Output the status line
echo "$output"
