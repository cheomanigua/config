# config
Config files for Linux systems

Use these config directories and files to quickly setup a fresh install of Ubuntu minimal + DWM (or Ubuntu minimal + Openbox) 

## Instructions

### Ubuntu

1. git clone https://github.com/cheomanigua/config.git 
2. cd config
3. chmod +x ubuntu_autoinstall_dwm.sh
4. sudo ./ubuntu_autoinstall_dwm.sh


### FreeBSD

#### Before using the script

```
su -
pkg info
pkg update
pkg --y sudo
pw group mod wheel -m cheo
pw group mod operator -m cheo
visudo
```
- `VISUDO editing below...`
- uncomment this line `# %wheel  ALL=(ALL) ALL)` (users in **wheel** group can `sudo`)
- uncomment this line `# %wheel ALL=(ALL) NOPASSWD: ALL` (users in **wheel** group can `sudo` without entering password. Use ONLY for temporary tasks!!)
- add this line `%operator ALL=(ALL) NOPASSWD: ALL` (users in **operator** group can reboot, shutdown, etc without sudoing)
- Now don't forget to logout from root account


#### Ready to use the script

```
cd
git clone https://github.com/cheomanigua/config.git
mv config/suckless/freebsd .
mv freebsd/freebsd_autoinstall_dwm.sh rc_conf .
./freebsd_autoinstall_dwm.sh
sudo ./rc_conf
```
