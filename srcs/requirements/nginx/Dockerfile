FROM debian:bullseye
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl /run/nginx
COPY ./part/nginx.sh /usr/local/bin/
EXPOSE 443
ENTRYPOINT ["nginx.sh"]
CMD ["nginx", "-g", "daemon off;"]
