#!/bin/bash
#
# gallery.sh - Create a grid image from all images in a folder
#
# Usage: ./gallery.sh [input_folder] [output_file] [columns]
#
# Requires: ImageMagick (sudo apt install imagemagick)

INPUT_DIR="${1:-.}"
OUTPUT="${2:-gallery.png}"
COLS="${3:-10}"
THUMB_SIZE="${4:-120x90}"

# Gather image files
shopt -s nullglob nocaseglob
FILES=("$INPUT_DIR"/*.{png,jpg,jpeg,gif,bmp,webp,tiff})
shopt -u nullglob nocaseglob

COUNT=${#FILES[@]}

if [ "$COUNT" -eq 0 ]; then
    echo "No images found in '$INPUT_DIR'"
    exit 1
fi

ROWS=$(( (COUNT + COLS - 1) / COLS ))

echo "Found $COUNT images"
echo "Grid: ${COLS} columns x ${ROWS} rows"
echo "Thumbnail size: $THUMB_SIZE"
echo "Output: $OUTPUT"
echo ""

montage "${FILES[@]}" \
    -thumbnail "$THUMB_SIZE" \
    -geometry "+2+2" \
    -tile "${COLS}x" \
    -background "#000000" \
    "$OUTPUT"

if [ $? -eq 0 ]; then
    echo "Done! Saved to $OUTPUT"
    SIZE=$(identify -format "%wx%h" "$OUTPUT")
    echo "Output dimensions: $SIZE"
else
    echo "Error creating gallery"
    exit 1
fi