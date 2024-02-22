#!/bin/sh

if [[ ! -f ./wp-config.php ]]; then
  wget http://wordpress.org/latest.tar.gz
  tar -zxf latest.tar.gz
  mv wordpress/* .
  rm -rf latest.tar.gz wordpress

  cp wp-config-sample.php wp-config.php
  sed -i "s/database_name_here/$MARIADB_DB/g" wp-config.php
  sed -i "s/username_here/$MARIADB_USER_ID/g" wp-config.php
  sed -i "s/password_here/$MARIADB_USER_PW/g" wp-config.php
  sed -i "s/localhost/$MARIADB_HOST/g" wp-config.php

  wp core install --allow-root \
      --url="https://$DOMAIN" \
      --title="Hello Inception!" \
      --admin_user="$WP_ADMIN_ID" \
      --admin_password="$WP_ADMIN_PW" \
      --admin_email="$USER@student.$ORG.$CNTRY"
  wp user create --allow-root \
      "$WP_USER_ID" \
      "hello@example.com" \
      --role="subscriber" \
      --user_pass="$WP_USER_PW"
fi
exec "$@"
