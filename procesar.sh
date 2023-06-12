#! /bin/bash

while IFS= read -r line; do
	echo "${line}.jpg"
done < nombres.txt > nombre1.txt

for i in [A-Z]*.jpg; do
	for j in nombre1.txt; do
		if [ $i = $j ]; then
			convert "$i" -gravity center -resize 512x512^ -extent 512x512 "$i"
		fi
	done
done
