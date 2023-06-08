#! /bin/bash

clear

read -p $'Ingrese cuantas imagenes quieres descargar\n' cantidad

if [ $cantidad -gt 0 ]; then
	nombres=$(curl https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv | grep -E  |  tr ' ' '_' | cut -d ',' -f 1 | head -n $cantidad )
	clear
	sleep 4s
	for nombre in $nombres; do
		wget -O $nombre.jpg https://source.unsplash.com/random/900%C3%97700/?person &> /dev/null
		sleep 10s
		echo La imagen $nombre.jpg se descargo
	done
else
	echo "Se ingreso un numero menor o igual que 0" && exit 1
fi

tar -czvf imagenes.tar.gz *.jpg
sha256sum archivo.tar.gz > sumaVerificadora.txt
