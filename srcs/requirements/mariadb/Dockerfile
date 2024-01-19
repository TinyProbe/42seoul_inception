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

COPY ./tools/mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
#COPY ./conf/mysqld.conf ~/my.cnf
#COPY ./conf/mysqld.conf /etc/mysql/my.cnf
#COPY ./conf/mysqld.conf /etc/my.cnf

RUN apt-get update \
  && \
    apt-get install -y mariadb-server mariadb-client vim \
  && \
    rm -rf /var/lib/apt/lists/* \
  && \
    mkdir -p /var/run/mysqld \
  && \
    chown -R mysql:mysql /var/run/mysqld \
  && \
    chmod 777 /var/run/mysqld \
  && \
    chmod +x /usr/local/bin/mariadb.sh \
  && \
    chmod +x /usr/local/bin/wordpress.sql

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]
