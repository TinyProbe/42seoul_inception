#!/bin/sh

openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/$USER.crt \
    -keyout /etc/nginx/ssl/$USER.key \
    -subj "/C=$CNTRY/ST=$STATE/L=$CITY/O=$ORG/OU=$USER/CN=$USER/"
echo "\
server {
  listen 443 ssl;
  listen [::]:443 ssl;
  server_name $DOMAIN;
  ssl_certificate /etc/nginx/ssl/$USER.crt;
  ssl_certificate_key /etc/nginx/ssl/$USER.key;
  ssl_protocols TLSv1.2 TLSv1.3;

  root /var/www/html;
  index index.php index.nginx-debian.html;

  location / {
    try_files \$uri \$uri/ /index.php;
  }

  location ~ \.php$ {
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass wordpress:9000;
    fastcgi_index index.php;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    fastcgi_param SCRIPT_NAME \$fastcgi_script_name;
  }
}
" > /etc/nginx/conf.d/nginx.conf
exec "$@"
