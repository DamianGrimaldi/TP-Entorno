FROM ubuntu

MAINTAINER EquipoRocker

RUN apt-get update && apt install -y git

RUN apt-get install imagemagick

RUN git clone https://github.com/DamianGrimaldi/TP-Entorno.git /home/TP

WORKDIR /home/TP

CMD ["bash", "~/menu.sh"]
