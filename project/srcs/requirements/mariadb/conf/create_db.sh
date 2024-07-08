#!/bin/bash
echo "FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS mine;
USE mine;

CREATE USER 'amahdiou'@'%' IDENTIFIED BY '0800';

ALTER USER 'root'@'localhost' IDENTIFIED BY '0900';

GRANT ALL PRIVILEGES ON *.* TO 'amahdiou'@'%';
FLUSH PRIVILEGES; " > exec.txt

mariadbd --user=mysql --bootstrap < exec.txt

exec "$@"