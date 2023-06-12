#! /bin/bash

cont1=0
cont2=0

while IFS= read -r line; do
	filename=$(basename "$line")
	filename="${filename%.*}"
	if echo "$filename" | grep -Eq "a"; then
		cont1=$((cont1+1))
	else
		cont2=$((cont2+1))
	fi
	echo $line >> Personas.txt
done < <(find . -name "*.jpg")

echo "La cantindade de personas femeninas son: $cont1 y de masculinas son: $cont2" >> Personas.txt
