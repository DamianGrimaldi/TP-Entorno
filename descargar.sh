#! /bin/bash

[ $# -ne 2 ] && echo error de la cantidad de argumentos && exit 1

imagenes=$(sha256sum $1 | cut -d ' ' -f 1)
verficacion=$(cat $2)

if [ $imagenes = $verficacion ]; then
	tar -xzf $1 && exit 0
	sleep 10
else
	echo Error de la suma de verificacion && exit 1
fi
