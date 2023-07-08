FROM ubuntu:latest

MAINTAINER Damian,Aylex,Brenda

RUN apt-get update && apt install -y git && apt-get install -y curl && apt-get install -y wget

RUN apt-get install -y imagemagick

RUN git clone https://DamianGrimaldi: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@github.com/DamianGrimaldi/TP-Entorno.git /home/TP

WORKDIR /home/TP

RUN mkdir /home/TP/salida

CMD ["bash", "/home/TP/menu.sh"]
