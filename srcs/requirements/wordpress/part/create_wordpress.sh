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
  sed -i "s/password_here/$MARIADB_PW/g" wp-config.php
  sed -i "s/localhost/$MARIADB_HOST/g" wp-config.php
fi

exec "$@"
