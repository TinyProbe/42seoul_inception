FROM debian:bullseye
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y wget curl bash php7.4 php7.4-fpm php7.4-mysql \
        php7.4-cli php7.4-common php7.4-opcache php7.4-readline \
        php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /run/php && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cl\
i.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
COPY ./part/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./part/wordpress.sh /usr/local/bin/
EXPOSE 9000
WORKDIR /var/www/html/
ENTRYPOINT ["/usr/local/bin/wordpress.sh"]
CMD ["/usr/sbin/php-fpm7.4", "-F"]
