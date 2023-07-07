#! /bin/bash

clear

[ $# -ne 2 ] && echo error de la cantidad de argumentos && exit 1

wget $1
wget $2

imagenes=$(sha256sum $1 | cut -d ' ' -f 1)
verficacion=$(cat $2)

if [ $imagenes = $verficacion ]; then
	echo Los archivos descargados corresponde a la imagen y a suma de verificacion && exit 0
else
	echo Los archivos descargados no corresponde con la suma de verificacion && exit 1
