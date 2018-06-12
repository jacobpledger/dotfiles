#!/bin/sh

icon_dir="$HOME/.icons/"

sudo apt install -y git

# ******************************************************************************
# Remove Junk
# ******************************************************************************
sudo apt remove -y \
	aisleriot brasero-* \
	cheese \
	five-or-more \
	four-in-a-row \
	gnome-clocks \
	gnome-dictionary \
	gnome-mahjongg \
	gnome-mines \
	gnome-nibbles \
	gnome-robots \
	gnome-sound-recorder \
	gnome-sudoku \
	hexchat \
	hitori \
	iagno \
	inkscape \
	libreoffice \
	lightsoff \
	onboard \
	onboard-data \
	parole \
	pidgin \
	pidgin-libnotify \
	sgt-puzzles \
	simple-scan \
	swell-foop \
	tali \
	thunderbird \
	ubuntu-mate-welcome \
	xfburn \
	xfce4-notes

# ******************************************************************************
# Snaps
# ******************************************************************************
sudo snap install canonical-livepatch
sudo snap install --classic slack
sudo snap install docker
sudo snap install keepassxc
# sudo snap install nextcloud-client
# sudo snap install spotify

# ******************************************************************************
# Add Repos
# ******************************************************************************

# sublime-text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# numix theme and icons
sudo add-apt-repository ppa:numix/ppa

sudo apt update

# ******************************************************************************
# install packages
# ******************************************************************************

# install separately so failures don't cascade

sudo apt install -y apt-transport-https # for sublime
sudo apt install -y emacs
sudo apt install -y evolution
sudo apt install -y evolution-ews
#sudo apt install -y firefox
sudo apt install -y htop
# sudo apt install -y nextcloud-client
# sudo apt install -y numix-gtk-theme
# sudo apt install -y numix-icon-theme-circle
sudo apt install -y openssh-server
sudo apt install -y openssh-sftp-server 
# sudo apt install -y plank
sudo apt install -y sublime-text
sudo apt install -y tmux
sudo apt install -y transmission
sudo apt install -y vim

sudo apt autoremove

# rust
curl https://sh.rustup.rs -sSf | sh

cd script
./bootstrap
