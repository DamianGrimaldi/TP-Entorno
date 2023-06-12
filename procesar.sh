#!/bin/bash

while IFS= read -r line; do
    echo "${line}.jpg"
done < nombres.txt > nombre1.txt

while IFS= read -r file; do
    if [ -f "$file" ]; then
        convert "$file" -gravity center -resize 512x512^ -extent 512x512 "$file"
    fi
done < nombre1.txt
