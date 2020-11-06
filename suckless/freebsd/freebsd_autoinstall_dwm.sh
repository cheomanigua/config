#!/bin/sh

### Downloading the files

cd
git clone https://github.com/cheomanigua/config.git
mv config/suckless/freebsd .


### Install and configure dwm

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
cp -r ../freebsd/dwm-bar dwm-bar
cd

