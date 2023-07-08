#! /bin/bash

clear

cont1=0

for archivo in *.jpg; do
	nombreArchivo=$(basename "$archivo")
	nombreArchivo="${nombreArchivo%.*}"
	if echo $nombreArchivo | grep -Eq "[A-Z][a-z]+a_"; then
		if echo $nombreArchivo | grep -Eq "_[a-z]+a"; then
			cont1=$((cont1+1))
		else
			cont1=$((cont1+1))
		fi
	else
		if echo $nombreArchivo | grep -Eq "_[a-z]+a"; then
			cont1=$((cont1+1))
		fi
	fi
	echo "$nombreArchivo" >> NombresImagenes.txt
done

echo "La cantindad de personas que termian en a: $cont1" >> TerminanEnA.txt

tar -czvf imagenes.tar.gz *.jpg NombresImagenes.txt TerminanEnA.txt nombres.txt && echo Se creo el archivo imagenes.tar.gz correctamente && rm *.jpg *.txt
mv imagenes.tar.gz salida/imagenes.tar.gz
sleep 5s

sha256sum imagenes.tar.gz | cut -d ' ' -f 1 > sumaVerificadora.txt && echo Se creo el archivo de la suma de verificacion
mv sumaVerificadora.txt salida/sumaVerificadora.txt
sleep 5s
