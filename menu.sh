#! /bin/bash

clear

read -p $'1-Generar imagenes\n2-Descargar\n3-Procesar\n4-Comprimir\n0-Para terminar\n' op

while [ $op -ne 0 ]; do
	case $op in
		1) ./generar.sh
		;;
		2) ./descargar.sh
		;;
		3) ./procesar.sh
		;;
		4) ./comprimir.sh
		;;
	esac
	read -p $'1-Generar imagenes\n2-Descargar\n3-Procesar\n4-Comprimir\n0-Para terminar\n' op
done
