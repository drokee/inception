FROM    debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server



RUN mkdir -p var/run/mysqld

RUN chmod 777 var/run/mysqld

COPY conf/create_db.sh /

RUN chmod 777 /create_db.sh
RUN chown root:root create_db.sh

ENTRYPOINT [ "sh", "./create_db.sh"]

CMD ["mariadbd", "--user=root"]

