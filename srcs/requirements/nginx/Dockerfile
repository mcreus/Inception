FROM debian:buster

RUN apt update \
    && apt-get install nginx -y \
    && apt-get install vim -y \
    && apt-get install curl -y

RUN mkdir -p /etc/nginx/ssl

RUN apt-get install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=OCCITANIE/L=Perpignan/O=42/OU=42/CN=mcreus.42.fr/UID=mcreus"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]