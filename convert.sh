#!/bin/bash

# use this to convert iphone photos to jpg's

# convert
for img in *.HEIC; do
    heif-convert "$img" "${img%.*}.jpg"
done

# rotate by -90 degrees
for img in *.jpg; do
    convert -rotate -90 "$img" "$img"
done

