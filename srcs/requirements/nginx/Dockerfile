FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/nginx/ /etc/nginx/sites-enabled/nginx
COPY ./tools/nginx_start.sh /var/www

RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT ["var/www/nginx_start.sh"]

CMD ["nginx", "-g", "daemon off;"]