#!/bin/bash
dir="${1:-.}"

files=("$dir"/*.png)
total=${#files[@]}
errors=0
count=0

for f in "${files[@]}"; do
    [ -f "$f" ] || continue
    
    ((count++))
    
    # Progress bar
    printf "\r[%d/%d] %s%s\033[K" "$count" "$total" "$dir/" "$(basename "$f")"
    
    # Check with magick identify
    metadata=$(magick identify -verbose "$f" 2>/dev/null | grep -iE "comment|author|software|copyright|exif|iptc|xmp|profile")
    
    if [ -n "$metadata" ]; then
        ((errors++))
        printf "\r\033[K[!] %s%s\n" "$dir/" "$(basename "$f")"
        echo "$metadata"
    fi
done

printf "\r\033[K"
echo "================================"
echo "Done. Checked $count files, $errors with metadata."