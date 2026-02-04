#!/bin/bash
dir="${1:-.}"

for f in "$dir"/*.png; do
    MSYS_NO_PATHCONV=1 magick "$f" -strip "PNG24:$f"
done