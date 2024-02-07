all: up

up:
	echo "#!/bin/sh" > __add_domain.sh
	echo "mkdir -p /home/tkong/data/mariadb/ /home/tkong/data/wordpress/" >> __add_domain.sh
	echo "if [ 0 -eq $$(cat /etc/hosts | grep 127.0.0.1 | grep tkong.42.kr -c) ]" >> __add_domain.sh
	echo "then" >> __add_domain.sh
	echo "  sudo echo '127.0.0.1 tkong.42.kr www.tkong.42.kr' >> /etc/hosts" >> __add_domain.sh
	echo "fi" >> __add_domain.sh
	chmod +x __add_domain.sh
	./__add_domain.sh
	sudo rm __add_domain.sh
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	echo "#!/bin/sh" > __clean.sh
	echo "docker stop $$(docker ps -qa | tr '\n' ' ') 2> tmp.tmp" >> __clean.sh
	echo "docker rm $$(docker ps -qa | tr '\n' ' ') 2> tmp.tmp" >> __clean.sh
	echo "docker rmi -f $$(docker images -qa | tr '\n' ' ') 2> tmp.tmp" >> __clean.sh
	echo "docker volume rm $$(docker volume ls -q | tr '\n' ' ') 2> tmp.tmp" >> __clean.sh
	echo "docker network rm $$(docker network ls -q | tr '\n' ' ') 2> tmp.tmp" >> __clean.sh
	echo "sudo rm -rf /home/tkong/data tmp.tmp" >> __clean.sh
	chmod +x __clean.sh
	./__clean.sh
	sudo rm __clean.sh

.PHONY: all up down clean
