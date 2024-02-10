# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkong <tkong@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/10 10:40:42 by tkong             #+#    #+#              #
#    Updated: 2024/02/10 10:40:42 by tkong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

if [ -f ./wp-config.php ]
then
  echo "-"
else
  wget http://wordpress.org/latest.tar.gz
  tar -zxf latest.tar.gz
  mv wordpress/* .
  rm -rf latest.tar.gz wordpress

  cp wp-config-sample.php wp-config.php
  sed -i "s/database_name_here/$MARIADB_DB/g" wp-config.php
  sed -i "s/username_here/$MARIADB_USER/g" wp-config.php
  sed -i "s/password_here/$MARIADB_USERPW/g" wp-config.php
  sed -i "s/localhost/$MARIADB_HOST/g" wp-config.php

  wp core install --allow-root \
      --url="https://$DOMAIN_NAME" \
      --title="Hello Inception!" \
      --admin_user="manager" \
      --admin_password="123123" \
      --admin_email="$USER@student.42seoul.kr"
  wp user create --allow-root \
      "$USER" \
      "$USER@example.com" \
      --role="subscriber" \
      --user_pass="123123"
fi
exec "$@"
