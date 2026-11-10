#!/usr/bin/env bash

menu=(
    " Keybinds"
    "󰹑  Screenshot"
    # "󰅇 Clipboard"
    # " Code"
    "󰞅 Emojis"
    "  Icons"
    "  Picker"
    # " VPN"
    " Bluetooth"
    # "󰁹 Power"
)

# Show rofi menu
selected=$(printf '%s\n' "${menu[@]}" | rofi -dmenu -i -p "Quick Actions" -theme ~/.config/rofi/quick-actions.rasi)

# Handle selection
if [ -n "$selected" ]; then

    case "$selected" in
        "󰹑  Screenshot")
            killall rofi
            sleep 0.05
            wayfreeze & PID=$!
            sleep 0.1
            REGION=$(slurp)
            kill $PID 2>/dev/null
            wait $PID 2>/dev/null
            sleep 0.6
            if [ -n "$REGION" ]; then
                grim -g "$REGION" -t png - | wl-copy -t image/png
                notify-send "Screenshot" "Copied to clipboard"
            else
                notify-send "Screenshot" "Cancelled"
            fi
            ;;
        "󰅇 Clipboard")
            kitty --class floating --title 'Clipboard Manager' -e clipse
            ;;
        " Code")
            kitty --class floating -e sh -c 'path=$(fd -H -E .git -t f -t d | fzf --prompt="Open in VS Code: " --height=100% --reverse --preview="bat --color=always --style=numbers {}" --preview-window=right:50%:wrap) && [ -n "$path" ] && code "$path"'
            ;;
        "󰞅 Emojis")
            rofi -show emoji -theme ~/.config/rofi/config.rasi
            ;;
        "  Icons")
            selected_icon=$(~/.config/waybar/scripts/icon-picker-helper.sh | rofi -dmenu -i -p "Icon Picker" -theme ~/.config/rofi/config.rasi)
            if [ -n "$selected_icon" ]; then
                icon=$(echo "$selected_icon" | awk '{print $1}')
                echo -n "$icon" | wl-copy
                notify-send 'Icon Picker' "Copihttps://github.com/davatorium/rofi-themes.gited: $icon"
            fi
            ;;
        "  Picker")
            # Use hyprpicker
            color=$(hyprpicker -a -f hex)
            if [ $? -eq 0 ]; then
                notify-send 'Color Picker' "Copied: $color"
            fi
            ;;
        " VPN")
            ~/.config/waybar/scripts/tailscale.sh
            ;;
        " Bluetooth")
            rofi-bluetooth
            ;;
        "󰁹 Power")
            ~/.config/waybar/scripts/power-profile.sh
            ;;
        " Keybinds")
            ~/.config/hypr/scripts/cheatsheet.sh
            ;;
    esac
fi