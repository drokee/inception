mkdir -p /var/www/html/wordpress
chmod -R 777 /var/www/html/wordpress

# chown -R www-data:www-data /var/www/html/wordpress

sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/8.2/fpm/pool.d/www.conf

cd /var/www/html/wordpress

#download the wp-cli.phar, (wp-cli stands for wordpress command line interface)
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

#download wordpress core files, --allow-root flag permits the command to be run as the root user
wp core download --allow-root

#creat the wp-config.php file with the specified informations (database name, user and user password)
wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb:3306 --allow-root

#insatll wordpress with the specified informations
wp core install --url=${WEBSITE} --title=inception --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL} --allow-root

#creat new user, and sets it's role to editor that can edit and publish posts, pages and comments ...etc
wp user create $USER_NAME $USER_EMAIL --role=editor --user_pass=$USER_PASS --allow-root

exec php-fpm8.2 -F