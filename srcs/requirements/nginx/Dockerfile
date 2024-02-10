# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkong <tkong@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/10 10:40:32 by tkong             #+#    #+#              #
#    Updated: 2024/02/10 10:40:32 by tkong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
