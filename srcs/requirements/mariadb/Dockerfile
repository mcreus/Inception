FROM    debian:buster

RUN     apt-get update -yq && \
        apt-get upgrade -y && \
        apt-get install mariadb-server \
        mariadb-client -y && \
        mkdir -p /var/run/mysqld && \
        chown -R mysql:mysql /var/run/mysqld && \
        chown -R mysql:mysql /etc/mysql/

COPY    ./tools/mariadb.sh /tmp/

COPY    ./conf/init.sql /tmp/

COPY    ./conf/50-server.cnf /etc/mysql

RUN     chown -R mysql:mysql /tmp/ && \
        chown -R mysql:mysql /etc/mysql \
        chmod +x /tmp/mariadb.sh

USER    mysql

ENTRYPOINT ["sh", "/tmp/mariadb.sh"]