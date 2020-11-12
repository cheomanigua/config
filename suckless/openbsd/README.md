# Instructions


### Before using the script

After a new fresh installation of OpenBSD, you must perform some manual configurations prior to running the automatic configuration script:

### doas

`doas` is like `sudo` in Linux. In order to add a user to `doas`, we must allow `keepenv` into the `:wheel` group:

`# cp /etc/examples/doas.conf /etc`

In order to make `doas` more persistent so we don't need to type the root password everytime, we can edit `/etc/doas.conf` so it looks like this:

`permit persist keepenv :wheel`


### WiFi configuration

You may also need to set up a wireless connection:

1. Find out your wireless interface:
```
ifconfig
```
Result: **rtwn0**

2. Fire up the device
```
doas ifconfig rtwn0 up
```

3. Scan wireless connections in order to find your SSID:
```
ifconfig rtwn0 scan | less
```

4. Edit/create `/etc/hostname.rtwn0`
```
join [SSID] wpakey [PASSWORD]
dhcp
```

5. Reboot

### Ready to use the script

As a user, run these commands:

```
cd
doas pkg_add git
git clone https://github.com/cheomanigua/config.git
doas chown -R $USER:$USER config
mv config/suckless/openbsd/openbsd_autoinstall_dwm .
sh openbsd_autoinstall_dwm
```

### Cleaning up

Once the configuration is finished, you can delete the following directory and file:
- `config/`
- `openbsd_autoinstall_dwm`

#### .xinitrc

- Should you decide to move the `suckless` directory somewhere else, don't forget to update the path for `dwm_bar.sh` on `.xinitrc`.
- Should you decide to move the `wallpaper.jpg` file somewhere else, don't forget to update the path for `feh` on `.xinitrc`.

