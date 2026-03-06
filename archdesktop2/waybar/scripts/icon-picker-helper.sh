#!/usr/bin/env bash

# Convert CSV hex codes to actual unicode characters for display
awk -F',' '{
    if(NF>=2 && $2 != "") {
        # Convert hex to decimal and then to unicode character
        code = "0x" $2
        cmd = "printf \"\\\\u" $2 " %s\\\\n\" \"" $1 "\""
        system(cmd)
    }
}' ~/.config/waybar/nerd-sheet.csv
