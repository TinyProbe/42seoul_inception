made in from debian 12.5.0 VM.<br><br>

# Var
[ur ID]: intra ID(strictly ur hostname & login user).<br>
[ur country ID]: kr, fr, en, etc... .<br>
[ur org]: 42seoul, 42vienna, 42sao paulo, etc... .<br><br>

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

# You have to modify each sources for you.<br>
tkong.42.kr -> [ur ID].42.[ur country ID]<br>
tkong -> [ur ID]<br>
42seoul -> [ur org]<br>
<br>
check all source files.<br><br>

# In terminal, after modify:<br>
```shell
sudo make [up|down|clean]
```

# On web browser(do after 30sec from docker-compose up finished):<br>
https://[ur ID].42.[ur country ID]<br><br>
whatever you choose type exactly.<br>
