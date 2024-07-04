FROM    debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server

# RUN mkdir -p var/run/mysqld
COPY conf/create_db.sh /
ENTRYPOINT [ "sh","/create_db.sh"]

