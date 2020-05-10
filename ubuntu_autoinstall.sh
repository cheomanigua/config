apt update
apt install openbox lxdm obconf obmenu qterminal featherpad pcmanfm tint2 gsimplecal feh numlockx lxappearance 
apt install firefox vlc
wget -qO- https://git.io/papirus-icon-theme-install | sh
apt install build-essential
apt install dmz-cursor-theme

wget https://images6.alphacoders.com/320/320424.jpg
mkdir .wallpaper
mv 320424.jpg ~/.wallpaper
rm -r ~/.icons
rm -r ~/.config
rm -r .git README.md
mv .icons ~/
mkdir ~/.config
cp -r * ~/.config
ln -s /usr/share/icons/DMZ-White/cursors ~/.icons/default/cursors
reboot

