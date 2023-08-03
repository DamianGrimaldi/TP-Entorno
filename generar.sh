#! /bin/bash

clear

read -p $'Ingrese cuantas imagenes quieres descargar\n' cantidad

if [ $cantidad -gt 0 ]; then
	cont=1
	while [ $cont -le $cantidad ]; do
		
		nombre=$( shuf -n 1 nombres.txt )
		
		if [[ $nombre != *.jpg ]];then
			
			wget -O $nombre.jpg https://thispersondoesnotexist.com/ &> /dev/null
			echo La imagen $nombre.jpg se descargo
			sleep 10s
			cont=$(($cont + 1))
			
		fi
	done
else
	echo "Se ingreso un numero menor o igual que 0"
	sleep 3s
fi

tar -czvf imagenes.tar.gz *.jpg && echo Se creo el archivo imagenes.tar.gz correctamente && rm *.jpg

sha256sum imagenes.tar.gz | cut -d ' ' -f 1 > sumaVerificadora.txt && echo Se creo el archivo de la suma de verificacion
