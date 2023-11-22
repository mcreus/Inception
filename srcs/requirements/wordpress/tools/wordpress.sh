#!/bin/sh

sed -i 's|PHP_PORT|'9000'|g' /etc/php/7.3/fpm/pool.d/www.conf

wp_path="/var/www/wordpress"

if [ ! -e "$wp_path/wp-config.php" ]; then
    echo "Creating wp-config.php..."
    wp --allow-root core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --dbprefix=wp_ --skip-check --path=$wp_path
    wp --allow-root core install --url="$DOMAIN_NAME" --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --skip-email --path=$wp_path
    wp --allow-root theme install teluro --activate --path=$wp_path
    wp --allow-root user create leon leon@le.on --role=author --user_pass=leon --path=$wp_path
fi

/usr/sbin/php-fpm7.3 -F
