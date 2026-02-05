files=$(ls bitmap_*.png | sort -t '_' -k 2 -n)

i=0
for file in $files; do
    new_name=$(printf "bitmap_%03d.png" $i)
    mv "$file" "$new_name"
    i=$((i+1))
done