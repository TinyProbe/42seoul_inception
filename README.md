made in from debian 12.5.0 VM.<br><br>

notification:<br>
[ur ID]: intra ID(strictly ur hostname & login user).<br>

# In terminal, virtual host machine:<br>
```shell
su -
echo "[ur ID] ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/sudoers
exit
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git make docker-compose
cd ~/Documents
git clone https://github.com/TinyProbe/42seoul_inception inception
cd inception
```

# You have to add .env file in ./srcs/.<br>
example:
```shell
DOMAIN=[ur ID].42.fr

CNTRY=kr
STATE=.
CITY=Seoul
ORG=42seoul
USER=[ur ID] # $USER@student.$ORG.$CNTRY

MARIADB_HOST=mariadb
MARIADB_DB=wp
MARIADB_ROOT_PW=123123
MARIADB_USER_ID=wp_user1
MARIADB_USER_PW=123123

WP_ADMIN_ID=manager
WP_ADMIN_PW=123123
WP_USER_ID=tkong
WP_USER_PW=123123
```
change value for you.<br>

# In terminal, after add .env:<br>
```shell
sudo make [up|down|clean]
```

# On web browser(do after 30sec from docker-compose up finished):<br>
https://[ur ID].42.fr<br>
