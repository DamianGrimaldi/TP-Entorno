FROM ubuntu:latest

MAINTAINER Damian,Aylex,Brenda

RUN apt-get update && apt-get install -y curl && apt-get install -y wget

RUN apt-get install -y imagemagick

ADD menu.sh /home/TP/menu.sh

ADD generar.sh /home/TP/generar.sh

ADD descomprimir.sh /home/TP/descomprimir.sh

ADD descargar.sh /home/TP/descargar.sh

ADD procesar.sh /home/TP/procesar.sh

ADD comprimir.sh /home/TP/comprimir.sh

WORKDIR /home/TP

RUN mkdir /home/TP/salida

CMD ["bash", "/home/TP/menu.sh"]
