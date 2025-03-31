#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx

sudo git clone https://github.com/SethWahle-com/SethWahle.com.git /var/www/sethwahle.com

sudo echo "server {" > /etc/nginx/sites-available/sethwahle.com
sudo echo "    listen 80;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    listen [::]:80;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    server_name sethwahle.com www.sethwahle.com;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    root /var/www/sethwahle.com/webroot/RPG/Website/www;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    index index.html;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    location / {" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "        try_files \$uri \$uri/ =404;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    }" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "}" >> /etc/nginx/sites-available/sethwahle.com

sudo chown -R $USER:$USER /var/www/sethwahle.com
sudo chmod -R 755 /var/www/sethwahle.com/webroot/RPG/Website/www

sudo ln -sf /etc/nginx/sites-available/sethwahle.com /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default

sudo ufw allow 'Nginx Full'
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw allow 'OpenSSH'
sudo ufw --force enable
sudo nginx -t
sudo systemctl reload nginx