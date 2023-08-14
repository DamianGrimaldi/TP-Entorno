#! /bin/bash

clear

cont1=0

for archivo in *.jpg; do
	nombreArchivo=$(basename "$archivo" | cut -d '.' -f 1)
	if echo $nombreArchivo | grep -Eq "a$_"; then
		cont1=$((cont1+1))
	fi
	echo "$nombreArchivo" >> NombresImagenes.txt
done

echo "La cantindad de personas que termian en a: $cont1" >> TerminanEnA.txt

mkdir salida &> /dev/null

tar -czvf imagenes.tar.gz *.jpg NombresImagenes.txt TerminanEnA.txt nombres.txt && echo Se creo el archivo imagenes.tar.gz correctamente && rm *.jpg *.txt

sha256sum imagenes.tar.gz | cut -d ' ' -f 1 > sumaVerificadora.txt && echo Se creo el archivo de la suma de verificacion
mv sumaVerificadora.txt salida/sumaVerificadora.txt
mv imagenes.tar.gz salida/imagenes.tar.gz
sleep 5s
