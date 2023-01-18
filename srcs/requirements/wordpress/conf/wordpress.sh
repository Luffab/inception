#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Setup Wordpress..."
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/
	echo "Creating Wordpress users"
	wp core install --allow-root --url=${DOMAIN_NAME} --title=${DB_DATABASE} --admin_user=${WP_ROOT_USERNAME} --admin_password=${WP_ROOT_PASSWORD} --admin_email=${WP_ROOT_EMAIL}
	wp user create --allow-root ${WP_USERNAME} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
	echo "Wordpress is setup"
fi

exec "$@"