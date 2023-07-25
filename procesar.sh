#!/bin/bash

clear

if [ ! -f nombres.txt ]; then
	curl https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv | tr ' ' '_' | cut -d ',' -f 1 | sed 's/.*/\u&/' > nombres.txt
fi

while IFS= read -r line; do
    echo "${line}.jpg"
done < nombres.txt > nombre1.txt

while IFS= read -r file; do
    if [ -f "$file" ]; then
        convert "$file" -gravity center -resize 512x512^ -extent 512x512 "$file"
    fi
done < nombre1.txt

sleep 10s
rm nombre1.txt
