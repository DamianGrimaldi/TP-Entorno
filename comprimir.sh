#! /bin/bash

clear

cont1=0
cont2=0

for archivo in *.jpg; do
	nombreArchivo=$(basename "$archivo")
	nombreArchivo="${nombreArchivo%.*}"
	if echo $nombreArchivo | grep -Eq "[A-Z][a-z]+a_"; then
		cont1=$((cont1+1))
	else
		if echo $nombreArchivo | grep -Eq "_[a-z]+a"; then
			cont1=$((cont1+1))
		else
			cont2=$((cont2+1))
		fi
	fi
	echo "$nombreArchivo" >> Personas.txt
done

echo "La cantindade de personas femeninas son: $cont1 y de masculinas son: $cont2" >> Personas.txt

tar -czvf imagenes.tar.gz *.jpg && echo Se creo el archivo imagenes.tar.gz correctamente && rm *.jpg

sha256sum imagenes.tar.gz | cut -d ' ' -f 1 > sumaVerificadora.txt && echo Se creo el archivo de la suma de verificacion
