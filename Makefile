all: up

up:
	echo "#!/bin/sh" > __add_domain.sh
	echo "mkdir -p /home/$(SUDO_USER)/data/mariadb /home/$(SUDO_USER)/data/wordpress" >> __add_domain.sh
	echo "sed -i 's/INTRA_ID/$(SUDO_USER)/g' ./srcs/docker-compose.yml" >> __add_domain.sh
	echo "if [ 0 -eq $$(cat /etc/hosts | grep 127.0.0.1 | grep $(SUDO_USER).42.fr -c) ]" >> __add_domain.sh
	echo "then" >> __add_domain.sh
	echo "  sudo echo '127.0.0.1 $(SUDO_USER).42.fr' >> /etc/hosts" >> __add_domain.sh
	echo "fi" >> __add_domain.sh
	chmod +x __add_domain.sh
	./__add_domain.sh
	rm -rf __add_domain.sh
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	echo "#!/bin/sh" > __clean.sh
	echo "sed -i 's/$(SUDO_USER)/INTRA_ID/g' ./srcs/docker-compose.yml" >> __clean.sh
	echo "docker stop $$(docker ps -qa | tr '\n' ' ') 1> __tmp.tmp 2> __tmp.tmp" >> __clean.sh
	echo "docker rm $$(docker ps -qa | tr '\n' ' ') 1> __tmp.tmp 2> __tmp.tmp" >> __clean.sh
	echo "docker rmi -f $$(docker images -qa | tr '\n' ' ') 1> __tmp.tmp 2> __tmp.tmp" >> __clean.sh
	echo "docker volume rm $$(docker volume ls -q | tr '\n' ' ') 1> __tmp.tmp 2> __tmp.tmp" >> __clean.sh
	echo "docker network rm $$(docker network ls -q | tr '\n' ' ') 1> __tmp.tmp 2> __tmp.tmp" >> __clean.sh
	echo "rm -rf /home/$(SUDO_USER)/data __tmp.tmp" >> __clean.sh
	chmod +x __clean.sh
	./__clean.sh
	rm -rf __clean.sh

.PHONY: all up down clean
