in terminal, virtual host machine:
su -<br>
echo "$USER ALL=(ALL:ALL) ALL" >> /etc/sudoers.tmp
exit
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git make docker-compose
cd Documents
git clone https://github.com/TinyProbe/42seoul_inception inception
cd inception

# you must have to do modify each sources for you.
# tkong.42.kr -> <ID>.42.[kr|fr]
# tkong -> <ID>
# check all source files.

after modify:
sudo make [up|down|clean]

in web browzer:
https://<ID>.42.[kr|fr]

# whatever you choose type exactly.
