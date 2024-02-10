in terminal, virtual host machine:<br>
su -<br>
echo "$USER ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/sudoers<br>
exit<br>
sudo apt update -y && sudo apt upgrade -y<br>
sudo apt install -y git make docker-compose<br>
cd Documents<br>
git clone https://github.com/TinyProbe/42seoul_inception inception<br>
cd inception<br>
<br>
you must have to do modify each sources for you.<br>
tkong.42.kr -> [ID].42.[kr|fr]<br>
tkong -> [ID]<br>
check all source files.<br>
<br>
after modify:<br>
sudo make [up|down|clean]<br>
<br>
in web browser:<br>
https://[ID].42.[kr|fr]<br>
<br>
whatever you choose type exactly.<br>
