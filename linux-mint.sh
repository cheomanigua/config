#!/bin/bash

sudo apt update && sudo apt upgrade
cd Downloads



#####################
##### LIBREWOLF #####
#####################

sudo apt update && sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates

distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then lsb_release -sc; else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

sudo apt update
sudo apt install librewolf -y



#####################
###### NEOVIM #######
#####################

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim

# Add kickstart configuration
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim



#####################
##### HUGO CLI ######
#####################

wget https://github.com/gohugoio/hugo/releases/download/v0.132.0/hugo_extended_0.132.0_linux-amd64.deb
sudo dpkg -i hugo_extended_0.132.0_linux-amd64.deb



#####################
#### GCLOUD CLI #####
#####################

sudo apt install apt-transport-https ca-certificates gnupg curl
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt update && sudo apt install google-cloud-cli



#####################
### FIREBASE CLI ####
#####################

curl -sL https://firebase.tools | bash



#####################
#### DOCKER CLI #####
#####################

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# Install Docker:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin



#####################
###### GOLANG #######
#####################

# Download go 1.23 version
wget https://go.dev/dl/go1.23.0.linux-amd64.tar.gz

# Remove any previous Go installation and extract the downloaded archive
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz

# Add /usr/local/go/bin to the PATH environment variable
sed -i '$ a\export PATH=$PATH:/usr/local/go/bin' ~/.profile
