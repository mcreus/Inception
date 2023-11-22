FROM debian:buster

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y nginx openssl \
    && mkdir -p /etc/nginx/ssl \
    && mkdir -p /run/nginx \
    && chown -R www-data /var/lib/nginx

COPY ./conf/server.conf /etc/nginx/sites-available/default.conf

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/nginx.sh /tmp/nginx.sh

RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE 443

ENTRYPOINT ["sh", "/tmp/nginx.sh"]