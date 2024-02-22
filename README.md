Made in from debian 12.5.0 VM.    

Notifications:  
[ur ID]: intra ID(strictly ur VM's hostname & login user).  

# In terminal, virtual host machine:  
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

# You have to add .env file in ./srcs/.  
example:
```shell
DOMAIN=[ur ID].42.fr

CNTRY=kr
STATE=.
CITY=Seoul
ORG=42seoul
USER=[ur ID] # $USER@student.$ORG.$CNTRY

MARIADB_HOST=mariadb # do not change.
MARIADB_DB=wp
MARIADB_ROOT_PW=123123
MARIADB_USER_ID=wp_user1
MARIADB_USER_PW=123123

WP_ADMIN_ID=manager
WP_ADMIN_PW=123123
WP_USER_ID=user1
WP_USER_PW=123123
```
Change the value to what works for you.  

# In terminal, after add .env:  
```shell
sudo make [up|down|clean]
```

# On web browser(do after 30sec from docker-compose up finished):  
https://[ur ID].42.fr  
