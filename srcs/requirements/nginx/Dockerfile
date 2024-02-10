FROM debian:bullseye
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl /run/nginx && \
    openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/tkong.crt \
        -keyout /etc/nginx/ssl/tkong.key \
        -subj "/C=KR/ST=./L=Seoul/O=42Seoul/OU=tkong/CN=tkong/"
COPY ./part/nginx.conf /etc/nginx/conf.d
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
