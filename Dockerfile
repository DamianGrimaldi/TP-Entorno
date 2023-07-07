FROM lubuntu:23.04

RUN sudo apt-get update && sudo apt --fix-bronken install && sudo apt-get install imagemagick

RUN git clone https://github.com/DamianGrimaldi/TP-Entorno.git cd ~/TP

WORKDIR ~/TP

CMD ["bash", "~/menu.sh"]
