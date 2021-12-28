#!/bin/bash

# unzips files, and moves their contents into a folder by the same name
# as the zip file, without the .zip extension

for z in ./*.zip; do
    unzip "$z" -d "${z%.*}"
done

