FROM    debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server



RUN mkdir -p /run/mysqld

RUN chown -R mysql:mysql /run/mysqld

RUN chmod 777 /run/mysqld

COPY conf/create_db.sh /

RUN chmod +x /create_db.sh
# RUN ./create_db.sh

ENTRYPOINT [ "sh", "./create_db.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]


