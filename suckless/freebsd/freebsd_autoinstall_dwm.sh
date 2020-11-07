#!/bin/sh

sudo pkg install --y xorg wget git

### Install and configure dwm

cd
mkdir suckless
cd suckless
git clone https://git.suckless.org/dwm
cd dwm
cp ../../freebsd/dwm/* .
sudo make clean install


### Install and configure st

cd ..
git clone git://git.suckless.org/st
cd st
cp ../../freebsd/st/* .
sudo make clean install


### Install and configure dmenu

cd ..
wget https://dl.suckless.org/tools/dmenu-5.0.tar.gz
tar -xvf dmenu-5.0.tar.gz
cd dmenu-5.0
cp ../../freebsd/dmenu/* .
sudo make clean install


### Install and configure dwm-bar

cd ..
git clone https://github.com/joestandring/dwm-bar.git
cp -r ../freebsd/dwm-bar/* dwm-bar
cd

### Install several packages

sudo pkg install --y feh py37-ranger zathura zathura-pdf-poppler simplescreenrecorder pulseaudio pavucontrol py37-ansible vscode 


### Creating and configuring .xinitrc
mv freebsd/wallpaper.jpg .
cat <<EOT >> .xinitrc
setxkbmap es
feh --bg-scale wallpaper.jpg &
freebsd/dwm-bar/dwm_bar.sh &
exec dwm
EOT


