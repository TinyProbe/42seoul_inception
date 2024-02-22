#!/bin/sh

/etc/init.d/mariadb start
if [[ ! -d "/var/lib/mysql/$MARIADB_DB" ]]; then 
  echo "
Y
Y
$MARIADB_ROOT_PW
$MARIADB_ROOT_PW
Y
n
Y
Y
" | mysql_secure_installation
  echo "grant all on *.* to 'root'@'%' identified by '$MARIADB_ROOT_PW'; \
      flush privileges;" | mariadb -u root
  echo "create database if not exists $MARIADB_DB; grant all on \
      $MARIADB_DB.* to '$MARIADB_USER_ID'@'%' identified by '$MARIADB_USER_PW';\
      flush privileges;" | mariadb -u root
fi
/etc/init.d/mariadb stop
exec "$@"
