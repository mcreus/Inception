mkdir -p /var/www/wordpress

chown -R www-data /var/www/wordpress

openssl req -x509 -nodes -days 365 \
-subj "/C=FR/ST=Occitanie/L=Perpignan/O=42/OU=42/CN=mcreus.42.fr/UID=mcreus" \
-keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt

sed -i 's|DOMAIN_NAME|mcreus.42.fr|g' /etc/nginx/sites-available/default.conf

sed -i 's|WP_PATH|/var/www/wordpress|g' /etc/nginx/sites-available/default.conf

sed -i 's|PHP_HOST|wordpress|g' /etc/nginx/sites-available/default.conf

sed -i 's|PHP_PORT|9000|g' /etc/nginx/sites-available/default.conf

sed -i 's|CERTS_KEY|/etc/nginx/ssl/inception.key|g' /etc/nginx/sites-available/default.conf

sed -i 's|CERTS_CRT|/etc/nginx/ssl/inception.crt|g' /etc/nginx/sites-available/default.conf

nginx -g "daemon off;"
