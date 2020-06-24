#!/bin/bash

sudo apt update
sudo apt install vim xserver-xorg xinit lynx zathura ranger -y
sudo apt install network-manager -y
sudo apt install git make libx11-dev libxft-dev libxinerama-dev -y
sudo apt install apt-transport-https curl -y

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
wget https://dl.suckless.org/tools/dmenu-4.9.tar.gz
tar -xvf dmenu-4.9.tar.gz
cd dmenu-4.9
sudo make clean install

cd
touch .xinitrc
echo "dwm" > .xinitrc

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
sudo chown -R $USER:$USER dwm
mv dwm/ .config/
