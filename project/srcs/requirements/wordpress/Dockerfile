FROM debian:12.5

RUN apt update -y

RUN apt install -y php8.2-fpm

RUN apt install -y php8.2-mysql

RUN apt install -y curl 

COPY ./conf/wp-config-create.sh /

RUN chmod 777 /wp-config-create.sh

CMD [ "sh", "wp-config-create.sh" ]