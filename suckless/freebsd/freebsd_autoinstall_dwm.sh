#!/bin/sh

### Downloading the files

# cd
# git clone https://github.com/cheomanigua/config.git
# mv config/suckless/freebsd .
# mv freebsd/freebsd_autoinstall_dwm.sh .
# chmod +x freebsd_autoinstall_dwm.sh
# ./freebsd_autoinstall_dwm.sh

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
cp -r ../freebsd/dwm-bar/* dwm-bar
cd

### Install several packages

sudo pkg install --y feh py37-ranger zathura zathura-pdf-poppler simplescreenrecorder pulseaudio pavucontrol py37-ansible vscode 


### Some /etc/rc.conf configuration
### Disabling sendmail and enabling time 
cat <<EOT >> /etc/rc.conf
# Disabling sendmail
sendmail_enable="NO"
sendmail_submit_enable="NO"
sendmail_outbound_enable="NO"
sendmail_msp_queue_enable="NO"

# Enabling time sync
ntpd_enable="YES"
ntpd_sync_on_start="YES"
EOT


### Creating and configuring .xinitrc
cat <<EOT >> .xinitrc
setxkbmap es
feh --bg-scale wallpaper.jpg &
freebsd/dwm-bar/dwm_bar.sh &
exec dwm
EOT


