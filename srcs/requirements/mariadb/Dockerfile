FROM debian:bullseye
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y mariadb-server mariadb-client && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    chmod 777 /run/mysqld
COPY ./part/mariadb.sh /usr/local/bin/
COPY ./part/mysqld.conf /etc/mysql/my.cnf
EXPOSE 3306
ENTRYPOINT ["mariadb.sh"]
CMD ["mariadbd", "--bind-address=0.0.0.0"]
