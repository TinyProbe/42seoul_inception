# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkong <tkong@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/04 16:33:00 by tkong             #+#    #+#              #
#    Updated: 2023/08/04 16:33:09 by tkong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update \
  && \
    apt-get install -y nginx openssl \
  && \
    mkdir -p /run/nginx \
  && \
    mkdir /etc/nginx/ssl \
  && \
    openssl req -newkey rsa:4096 -x509 -sha256 -nodes -days 365 \
        -out /etc/nginx/ssl/vbachele.crt \
        -keyout /etc/nginx/ssl/vbachele.key \
        -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=tkong/CN=tkong/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
