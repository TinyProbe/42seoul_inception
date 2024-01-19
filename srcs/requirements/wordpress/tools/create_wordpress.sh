# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_wordpress.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkong <tkong@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/19 15:09:22 by tkong             #+#    #+#              #
#    Updated: 2024/01/19 15:09:22 by tkong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

if [ -f ./wp-config.php ]
then
  echo "wordpress already downloaded"
else
  wget http://wordpress.org/latest.tar.gz
  tar -zxf latest.tar.gz
  mv wordpress/* .
  rm -rf latest.tar.gz wordpress

  cp wp-config-sample.php wp-config.php
  sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
  sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
  sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config.php
  sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
fi

exec "$@"
