#!/bin/bash

input="$HOME/Desktop/input.txt"
output="$HOME/Desktop/output.txt"

echo "" > $output

while read line; do

    match=$(grep -w -e "frame.time" -e "wlan.fc.type" -e "wlan.fc.subtype" <<< "$line")
    if [[ -n "$match" ]]; then
        echo "$match" >> "$output"
    fi
done < "$input"

cat "$output"
