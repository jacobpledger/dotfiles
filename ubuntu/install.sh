#!/bin/sh

icon_dir="$HOME/.icons/"
# 
# Gnome 3
# 
# fix gnome's handling of wallpapers
rm -r ~/.cache/gnome-control-center/backgrounds
ln -s $HOME/Pictures/Wallpapers/ $HOME/.cache/gnome-control-center/backgrounds

# write sane gnome 3 defaults

# workspaces span monitors (otherwise one is static)
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
# prevent alt-tab from showing apps on all workspaces
gsettings set org.gnome.shell.app-switcher current-workspace-only true
# disable animations - speeds up workspace switching
gsettings set org.gnome.desktop.interface enable-animations "false"

sudo apt install -y git

# remove junk
sudo apt remove -y aisleriot brasero-* cheese five-or-more four-in-a-row gnome-clocks gnome-dictionary gnome-mahjongg gnome-mines gnome-nibbles gnome-robots gnome-sound-recorder gnome-sudoku hexchat hitori iagno inkscape libreoffice lightsoff simple-scan swell-foop tali thunderbird xfburn xfce4-notes

# install snaps for trendyness
sudo snap install cannonical-livepatch libreoffice nextcloud-client spotify
sudo snap install --classic slack

# add repos

# sublime-text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt update

# install packages
sudo apt install -y docker-compose evince firefox sublime-text tmux transmission vagrant vim virtualbox xrdp

# rust
curl https://sh.rustup.rs -sSf | sh

sudo apt autoremove

cd script
./bootstrap
