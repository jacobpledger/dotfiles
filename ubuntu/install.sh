#!/bin/sh

# Get the codename of the Ubuntu release for sources that require it.
. /etc/os-release
read UBUNTU_VERSION_NAME << "$VERSION"

icon_dir="$HOME/.icons/"

sudo apt install -y git

# ******************************************************************************
# Remove Junk
# ******************************************************************************
sudo apt remove -y \
	abiword \
	aisleriot \
	brasero-* \
	catfish \
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

# Prefer snaps over repos for cross-distro compatibility with other devs

sudo snap install canonical-livepatch
sudo snap install --classic slack
sudo snap install docker
# sudo snap install firefox
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
# sudo add-apt-repository ppa:numix/ppa

# dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
echo "deb http://linux.dropbox.com/ubuntu $UBUNTU_VERSION_NAME main" | sudo tee /etc/apt/sources.list.d/dropbox.list

sudo apt update

# ******************************************************************************
# install packages
# ******************************************************************************

# install separately so failures don't cascade

sudo apt install -y apt-transport-https  # for sublime
sudo apt install chrome-gnome-shell  # for gnome shell extension connector
sudo apt install -y dropbox
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
