
mkdir -p "without_metadata"

for f in *.m4a *.mp3; do
    [ -e "$f" ] || continue
    echo "Cleaning (lossless): $f"

    ffmpeg -i "$f" \
        -map 0:a \
        -c:a copy \
        -map_metadata -1 \
        -map_chapters -1 \
        -vn \
        "without_metadata/$f"
done
