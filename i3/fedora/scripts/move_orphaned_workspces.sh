#!/usr/bin/env bash

# Polling interval (seconds)
INTERVAL=2

# Get active outputs
get_outputs() {
    xrandr --current | awk '/ connected/ {print $1}'
}

# Move all workspaces on missing outputs to primary
move_orphans() {
    active_outputs=($(get_outputs))
    primary="${active_outputs[0]}"  # fallback target

    # Query i3 for workspaces
    # We extract: <workspace_name> <output_name>
    i3-msg -t get_workspaces | \
        jq -r '.[] | "\(.name) \(.output)"' | while read -r ws out; do
        
        # If the workspace is on a disconnected output, move it
        if ! printf "%s\n" "${active_outputs[@]}" | grep -qx "$out"; then
            i3-msg workspace "$ws" >/dev/null
            i3-msg move workspace to output "$primary" >/dev/null
        fi
    done
}

# Main polling loop
last_outputs="$(get_outputs | sort)"

while true; do
    sleep "$INTERVAL"

    current_outputs="$(get_outputs | sort)"
    if [[ "$current_outputs" != "$last_outputs" ]]; then
        move_orphans
        last_outputs="$current_outputs"
    fi
done

