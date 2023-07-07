#! /bin/bash

clear

read -p $'1-Generar imagenes\n2-Descargar\n3-Descomprimir\n4-Procesar\n5-Comprimir\n0-Para terminar\n' op

while [ $op -ne 0 ]; do
	case $op in
		1) ./generar.sh
		clear
		;;
		2)read -p $'Ingrese el url del archivo a donde contenga las imagenes\n' u1
		read -p $'Ingrese la url del archivo de la suma de verificacion\n' u2
		./descargar.sh $u1 $u2
		;;
		3) read -p $'Ingrese el nombre del archivo de donde estan las imagenes\n' p1
		read -p $'Ingrese el nombre del archivo de la suma de verificacion\n' p2
		./descomprimir.sh $p1 $p2
		clear
		;;
		4) ./procesar.sh
		clear
		;;
		5) ./comprimir.sh
		clear
		;;
	esac
	read -p $'1-Generar imagenes\n2-Descargar\n3-Procesar\n4-Comprimir\n0-Para terminar\n' op
done
