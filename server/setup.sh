# install digitalocean monitoring
curl -sSL https://agent.digitalocean.com/install.sh | sh

# LetsEncrypt

# install certbot
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-apache

# requires input
sudo certbot --apache



# my own custom server config

sudo apt install nginx

# certbot

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx 

sudo certbot --nginx
