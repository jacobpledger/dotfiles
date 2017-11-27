sudo apt-get update
sudo apt-get install xvfb
sudo apt-get install imagemagick
mkdir ~/calibre-library

ln -s server

# necessary for allowing access to the port
sudo ufw allow 8080/tcp

calibre-server ~/calibre-library