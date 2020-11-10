#!/bin/bash

# If you are running this script, it is because you ran git clone https://github.com/cheomanigua/config.git
# and run cd config

doas pkg_add wget coreutils ranger feh


### Install and configure dwm

cd
mkdir suckless 
cd suckless
git clone git://git.suckless.org/dwm
cd dwm
cp ../../openbsd/dwm/* .
doas make clean install


### Install and confiture st

cd ..
git clone git://git.suckless.org/st
cd st
cp ../../openbsd/st/* .
doas make clean install


### Install and configure dmenu

cd ..
wget https://dl.suckless.org/tools/dmenu-5.0.tar.gz
tar -zxvf dmenu-5.0.tar.gz
cd dmenu-5.0
cp ../../openbsd/dmenu/* .
doas make clean install


### Install and configure dwm-bar

cd ..
git clone https://github.com/joestandring/dwm-bar.git
cp -r ../openbsd/dwm-bar/* dwm-bar
cd


### Creating and configuring .xinitrc
mv openbsd/wallpaper.jpg .
cat <<EOT >> .xinitrc
setxkbmap es
feh --bg-scale wallpaper.jpg &
openbsd/dwm-bar/dwm_bar.sh &
exec dwm
EOT

### Add Spanish keyboard support
cat <<EOT >> .profile
echo "export LANG=en_US.UTF-8" >> .profile
alias ls='gls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lah'
EOT

#curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | doas apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
#echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | doas tee /etc/apt/sources.list.d/brave-browser-release.list
#doas apt update
#doas apt install -y brave-browser

