# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkong <tkong@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/10 10:40:10 by tkong             #+#    #+#              #
#    Updated: 2024/02/10 10:40:10 by tkong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

/etc/init.d/mariadb start
if [ -d "/var/lib/mysql/$MARIADB_DB" ]
then 
  echo "-"
else
  echo "
Y
Y
123123
123123
Y
n
Y
Y
" | mysql_secure_installation
  echo "grant all on *.* to 'root'@'%' identified by '$MARIADB_ROOTPW'; \
      flush privileges;" | mariadb -u root
  echo "create database if not exists $MARIADB_DB; grant all on \
      $MARIADB_DB.* to '$MARIADB_USER'@'%' identified by '$MARIADB_USERPW'; \
      flush privileges;" | mariadb -u root
fi
/etc/init.d/mariadb stop
exec "$@"
