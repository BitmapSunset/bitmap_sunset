#!/bin/bash

# Generate thumbnails for bitmap images
# Requires ImageMagick: sudo apt install imagemagick

INPUT_DIR="pics"
OUTPUT_DIR="thumbs"
THUMB_WIDTH=120

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Generate thumbnails
for i in $(seq 0 599); do
  filename=$(printf "bitmap_%03d.png" $i)
  input="$INPUT_DIR/$filename"
  output="$OUTPUT_DIR/$filename"
  
  if [ -f "$input" ]; then
    magick "$input" -resize ${THUMB_WIDTH}x "$output"
    echo "Generated: $output"
  else
    echo "Skipped (not found): $input"
  fi
done

echo "Done! Thumbnails saved to $OUTPUT_DIR"