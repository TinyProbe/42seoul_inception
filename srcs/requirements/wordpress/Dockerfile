# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkong <tkong@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/04 16:33:00 by tkong             #+#    #+#              #
#    Updated: 2023/08/04 16:33:09 by tkong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update \
  && \
    apt-get install -y \
        wget curl bash php php-cgi php-mysql \
        php-fpm php-pdo php-gd php-cli \
        php-mbstring php-redis redis \
  && \
    rm -rf /var/lib/apt/lists/* \
  && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && \
    chmod +x wp-cli.phar \
  && \
    mv wp-cli.phar /usr/local/bin/wp \
  && \
    mkdir /run/php \
  && \
    chmod +x /usr/local/bin/create_wordpress.sh

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/create_wordpress.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
