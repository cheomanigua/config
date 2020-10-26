#!/bin/bash

# If you are running this script, it is because you ran git clone https://github.com/cheomanigua/config.git
# and run cd config

sudo apt update
sudo apt install vim xserver-xorg xinit lynx zathura ranger feh -y
sudo apt install network-manager -y
sudo apt install git make libx11-dev libxft-dev libxinerama-dev -y
sudo apt install apt-transport-https curl -y



##### DWM INSTALLATION STARTS #####

cd
mkdir dwm
cd dwm
git clone git://git.suckless.org/dwm
cd dwm
sudo make clean install
cd ..
git clone git://git.suckless.org/st
cd st
sudo make clean install
cd ..
wget https://dl.suckless.org/tools/dmenu-5.0.tar.gz
tar -xvf dmenu-5.0.tar.gz
cd dmenu-5.0
sudo make clean install

cd
sudo chown -R $USER:$USER dwm

cp config/dwm/dwm/config.h dwm/dwm/config.h
cp config/dwm/st/config.h dwm/st/config.h
mkdir -p ~/.config
mv dwm/ .config/

touch .xinitrc
echo "dwm" > .xinitrc

# Follow further instructions on https://linuxdocs.netlify.app/i3wm#dwm for
# changing MOD key, creating status monitor and adding dwm to windows session

##### DWM INSTALLATION ENDS #####



sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
nmcli radio wifi on
nmcli device wifi connect MOVISTAR_CFCD password QlatrCMgyBpDGySYSekK

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

#cd Downloads
#wget https://zoom.us/client/latest/zoom_amd64.deb
#sudo dpkg -i zoom_amd64.deb
#sudo apt install -f -y

setxkbmap es

