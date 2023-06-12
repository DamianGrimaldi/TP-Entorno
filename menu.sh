#! /bin/bash

clear

read -p $'1-Generar imagenes\n2-Descargar\n3-Procesar\n4-Comprimir\n0-Para terminar\n' op

while [ $op -ne 0 ]; do
	case $op in
		1) ./generar.sh
		clear
		;;
		2) read -p $'Ingrese el nombre del archivo de donde estan las imagenes\n' p1
		read -p $'Ingrese el nombre del archivo de la suma de verificacion\n' p2
		./descargar.sh $p1 $p2
		clear
		;;
		3) ./procesar.sh
		clear
		;;
		4) ./comprimir.sh
		clear
		;;
	esac
	read -p $'1-Generar imagenes\n2-Descargar\n3-Procesar\n4-Comprimir\n0-Para terminar\n' op
done
