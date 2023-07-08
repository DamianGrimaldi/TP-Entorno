#! /bin/bash

clear

cont1=0

for archivo in *.jpg; do
	nombreArchivo=$(basename "$archivo")
	nombreArchivo="${nombreArchivo%.*}"
	if echo $nombreArchivo | grep -Eq "[A-Z][a-z]+a_"; then
		cont1=$((cont1+1))
	else
		if echo $nombreArchivo | grep -Eq "_[a-z]+a"; then
			cont1=$((cont1+1))
		fi
	fi
	echo "$nombreArchivo" >> NombresImagenes.txt
done

echo "La cantindad de personas que termian en a: $cont1" >> TerminanEnA.txt

tar -czvf imagenes.tar.gz *.jpg *.txt && echo Se creo el archivo imagenes.tar.gz correctamente && rm *.jpg *.txt
mv imagenes.tar.gz salida/

sha256sum imagenes.tar.gz | cut -d ' ' -f 1 > sumaVerificadora.txt && echo Se creo el archivo de la suma de verificacion
mv sumaVerificadora.txt salida/
