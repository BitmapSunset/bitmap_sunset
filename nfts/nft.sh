for j in {1..10}
do
for i in {000..009}
do
    mkdir -p "./avif/320_q$j/"
    mkdir -p "./webp/320_q$j/"
    mkdir -p "./jpeg/320_q$j/"
    crf=$(((j - 1) * 7))
    ffmpeg -i ./bitmap_$i.png -c:v libaom-av1 -crf $crf -vf scale=320:240 -map_metadata -1 ./avif/320_q$j/bitmap_$i.avif
    qwebp=$(((11 - j) * 10))
    ffmpeg -i ./bitmap_$i.png -q:v $j -vf scale=320:240 -map_metadata -1 -update 1 -frames:v 1 ./jpeg/320_q$j/bitmap_$i.jpeg
done
done