# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkong <tkong@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/04 15:28:54 by tkong             #+#    #+#              #
#    Updated: 2023/08/04 15:28:56 by tkong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up

up:
	@mkdir -p ~/data/{mysql,wordpress}
	docker-compose -f./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f./srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q);

.PHONY: all up down clean
