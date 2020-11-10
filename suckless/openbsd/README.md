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

### Ready to use the script

As a user, run these commands:

```
cd
git clone https://github.com/cheomanigua/config.git
mv config/suckless/ubuntu .
mv ubuntu/ubuntu_autoinstall_dwm.sh .
./ubuntu_autoinstall_dwm.sh
```

### Cleaning up

Once the configuration is finished, you can delete the following directories:
- `config`
- `ubuntu`

#### .xinitrc

- Should you decide to move the `suckless` directory somewhere else, don't forget to update the path for `dwm_bar.sh` on `.xinitrc`.
- Should you decide to move the `wallpaper.jpg` file somewhere else, don't forget to update the path for `feh` on `.xinitrc`.
