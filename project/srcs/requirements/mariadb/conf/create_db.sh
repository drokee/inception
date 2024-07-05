#!/bin/bash
echo "CREATE DATABASE IF NOT EXISTS mine;
USE mine;

CREATE USER 'amahdiou'@'localhost' IDENTIFIED BY '0800';

GRANT ALL PRIVILEGES ON amahdiou.* TO 'amahdiou'@'localhost';
FLUSH PRIVILEGES; " > exec.txt

mariadbd --user=root --bootstrap < exec.txt

exec "$@"