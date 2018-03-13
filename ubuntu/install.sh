#!/bin/sh

icon_dir="$HOME/.icons/"

sudo apt install -y git

# remove junk
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
	parole \
	sgt-puzzles \
	simple-scan \
	swell-foop \
	tali \
	thunderbird \
	ubuntu-mate-welcome \
	xfburn \
	xfce4-notes

# install snaps for trendyness
sudo snap install cannonical-livepatch
sudo snap install --classic slack

# add repos

# sublime-text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# nextcloud
sudo add-apt-repository ppa:nextcloud-devs/client

# docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# numix theme and icons
sudo add-apt-repository ppa:numix/ppa

sudo apt update

# install packages
sudo apt install -y \
	docker-ce \
	docker-compose \
	evince \
	evolution \
	evolution-ews \
	firefox \
	mpv \
	nextcloud-client \
	numix-gtk-theme \
	numix-icon-theme-circle\
	plank \
	sublime-text \
	tmux \
	transmission \
	vagrant \
	vim \
	virtualbox

sudo apt autoremove

# rust
curl https://sh.rustup.rs -sSf | sh

# customization
mkdir -p $HOME/Development/Workflow
git clone https://github.com/LinxGem33/Plank-Themes.git $HOME/Development/Workflow/

cd script
./bootstrap
