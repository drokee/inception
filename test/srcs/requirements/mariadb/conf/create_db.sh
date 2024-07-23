#!/bin/bash
echo "FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
ALTER USER 'root'@'localhost' IDENTIFIED BY '0900';

CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';


GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES; " > exec.txt

mariadbd -u mysql --bootstrap < exec.txt

exec "$@"