# Instructions


### Before using the script

After a new fresh installation of Ubuntu, you must perform some manual configurations prior to running the automatic configuration script:

```
su -
apt update
usermod -aG sudo $USER
exit
```

You may also need to set up a wireless connection:

```
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
nmcli d
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect <SSID> password <PASSWORD>
```

### Keyboard locale

This script sets a Spanish keyboard. 
- If you are using an English keyboard, edit the `ubuntu_autoinstall_dwm` file and delete the line `setxkbmap es`
- If you are using a non English keyboard, edit the `ubuntu_autoinstall_dwm` file and change the line `setxkbmap es` to `sexkbmap <language\>`

### Ready to use the script

As a user, run these commands:

```
cd
git clone https://github.com/cheomanigua/config.git
sudo chown -R $USER:$USER config
mv config/suckless/ubuntu/ubuntu_autoinstall_dwm .
./ubuntu_autoinstall_dwm
```

### Cleaning up

Once the configuration is finished, you can delete the following directory and file:
- `config/`
- `ubuntu_autoinstall_dwm`

#### .xinitrc

- Should you decide to move the `suckless` directory somewhere else, don't forget to update the path for `dwm_bar.sh` on `.xinitrc`.
- Should you decide to move the `wallpaper.jpg` file somewhere else, don't forget to update the path for `feh` on `.xinitrc`.

