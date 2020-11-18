# Instructions


### Before using the script

After a new fresh installation of FreeBSD, you must perform some manual configurations prior to running the automatic configuration script:

```
su -
pkg info
pkg update
pkg --y sudo
pw group mod wheel -m cheo
visudo
```
- `VISUDO editing below...`
- uncomment this line `# %wheel  ALL=(ALL) ALL)` (users in **wheel** group can `sudo`)
- uncomment this line `# %wheel ALL=(ALL) NOPASSWD: ALL` (users in **wheel** group can `sudo` without entering password. Use ONLY for temporary tasks!!)
- Logout from the root account:
```
exit
```

### Keyboard locale

This script sets a Spanish keyboard. 
- If you are using an English keyboard, edit the `freebsd_autoinstall_dwm` file and delete the line `setxkbmap es`
- If you are using a non English keyboard, edit the `freebsd_autoinstall_dwm` file and change the line `setxkbmap es` to `setxkbmap <language\>`

### Ready to use the script

As a user, run these commands:

```
cd
git clone https://github.com/cheomanigua/config.git
sudo chown -R $USER:$USER config
mv config/suckless/freebsd/freebsd_autoinstall_dwm rc_conf .
./freebsd_autoinstall_dwm
sudo ./rc_conf
```

### Cleaning up

Once the configuration is finished, you can delete the following directory and files:
- `config/`
- `freebsd_autoinstall_dwm`
- `rc_conf`

Also, don't forget revoke the privilege of not using password for `sudo` to the user:

```
su -
visudo
```
- `VISUDO editing below...`
- comment this line `%wheel ALL=(ALL) NOPASSWD: ALL`


#### .xinitrc

- Should you decide to move the `suckless` directory somewhere else, don't forget to update the path for `dwm_bar.sh` on `.xinitrc`.
- Should you decide to move the `wallpaper.jpg` file somewhere else, don't forget to update the path for `feh` on `.xinitrc`.
