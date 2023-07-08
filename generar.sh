#! /bin/bash

clear

read -p $'Ingrese cuantas imagenes quieres descargar\n' cantidad

if [ $cantidad -gt 0 ]; then
	cont=1
	curl https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv | tr ' ' '_' | cut -d ',' -f 1 | sed 's/.*/\u&/' > nombres.txt
	while [ $cont -le $cantidad ]; do
		
		nombre=$( shuf -n 1 nombres.txt )
		
		if [[ $nombre != *.jpg ]];then
			
			wget -O $nombre.jpg https://thispersondoesnotexist.com/ &> /dev/null
			sleep 10s
			echo La imagen $nombre.jpg se descargo
			cont=$(($cont + 1))
			
		fi
	done
else
	echo "Se ingreso un numero menor o igual que 0" && exit 1
fi

tar -czvf imagenes.tar.gz *.jpg && echo Se creo el archivo imagenes.tar.gz correctamente && rm *.jpg

sha256sum imagenes.tar.gz | cut -d ' ' -f 1 > sumaVerificadora.txt && echo Se creo el archivo de la suma de verificacion
y despues en el archivo de generar
