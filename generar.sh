#! /bin/bash

clear

read -p $'Ingrese cuantas imagenes quieres descargar\n' cantidad

if [ $cantidad -gt 0 ]; then
	cont=1
	curl https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv | tr ' ' '_' | cut -d ',' -f 1 > nombres.txt
	while [ $cont -le $cantidad ]; do
		
		nombre=$( shuf -n 1 nombres.txt )
		
		if [ $nombre -ne *.jpg ] ;then
			
			cont=$(($cont + 1))
			wget -O $nombre.jpg https://source.unsplash.com/random/900%C3%97700/?person &> /dev/null
			sleep 10s
			echo La imagen $nombre.jpg se descargo
			
		fi
		
else
	echo "Se ingreso un numero menor o igual que 0" && exit 1
fi

tar -czvf imagenes.tar.gz *.jpg && echo Se creo el archivo imagenes.tar.gz correctamente && rm *.jpg

sha256sum imagenes.tar.gz > sumaVerificadora.txt && echo Se creo el archivo de la suma de verificacion

rm nombres.txt
