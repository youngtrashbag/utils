#!/bin/bash

for file in ./*; do
    if [ -d "$file" ]; then
        foldername=$(basename "${file}")
        echo ${foldername}

        magnetfile="${file}/magnet"
        if [ -f "$magnetfile" ]; then
            magnetlink=$(cat "${magnetfile}")
            echo ${magnetlink}
        else
            echo "No magnet file found"
        fi
        printf "\n\n"
    fi
done
