#! /bin/bash

clear

[ $# -ne 2 ] && echo error de la cantidad de argumentos && exit 1

if [ -f $1 ] && [ -f $2 ]; then
	
	imagenes=$(sha256sum $1 | cut -d ' ' -f 1)
	verficacion=$(cat $2)

	if [ $imagenes = $verficacion ]; then
		tar -xzf $1
		rm "$1" "$2"
		sleep 3s
	else
		echo Error de la suma de verificacion
		exit 1
		sleep 3s
	fi
else
	echo Lo que se a pasado no son archivos
	sleep 3s
	exit 1
fi
