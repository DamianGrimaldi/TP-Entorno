FROM ubuntu:latest

MAINTAINER EquipoRocker

RUN apt-get update && apt install -y git

RUN apt-get install -y imagemagick

RUN git clone https://DamianGrimaldi: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@github.com/DamianGrimaldi/TP-Entorno.git /home/TP

WORKDIR /home/TP

CMD ["bash", "./menu.sh"]
