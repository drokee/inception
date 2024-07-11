#!/bin/bash

# Directory and permissions
mkdir -p /var/www/html/wordpress

chmod -R 777 /var/www/html/wordpress
# chown -R www-data:www-data /var/www/html/wordpress

# Modify PHP-FPM configuration
sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/8.2/fpm/pool.d/www.conf

cd /var/www/html/wordpress

# Download and setup wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download WordPress core files
wp core download --allow-root

# Create wp-config.php
wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="mariadb:3306" --allow-root

# Install WordPress
wp core install --url="${WEBSITE}" --title=inception --admin_user="${ADMIN_USER}" --admin_password="${ADMIN_PASS}" --admin_email="${ADMIN_EMAIL}" --allow-root

# Create new user
wp user create "${USER}" "${EMAIL}" --role=editor --user_pass="${PASS}" --allow-root

# Start PHP-FPM
exec php-fpm8.2 -F
