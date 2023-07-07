#! /bin/bash

clear

[ $# -ne 2 ] && echo error de la cantidad de argumentos && exit 1

wget $1
wget $2
