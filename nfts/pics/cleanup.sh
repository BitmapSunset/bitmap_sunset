#!/bin/bash
dir="${1:-.}"

# Count total files
files=("$dir"/*.png)
total=${#files[@]}
current=0

for f in "${files[@]}"; do
    ((current++))
    percent=$((current * 100 / total))
    bar=$((percent / 2))
    printf "\r[%-50s] %d%% (%d/%d) %s" "$(printf '#%.0s' $(seq 1 $bar))" "$percent" "$current" "$total" "$(basename "$f")"
    MSYS_NO_PATHCONV=1 magick "$f" -strip "PNG24:$f"
done

echo -e "\nDone!"