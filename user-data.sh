#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y \
sudo apt install nginx -y \
sudo systemctl enable nginx \
sudo systemctl start nginx \

sudo git clone https://github.com/SethWahle-com/SethWahle.com.git /var/www/sethwahle.com \
sudo chown -R $USER:$USER /var/www/sethwahle.com \  
sudo chmod -R 755 /var/www/sethwahle.com/www/ \
sudo tee /etc/nginx/sites-available/sethwahle.com > /dev/null << 'EOL'
server {
    listen 80;
    listen [::]:80;
    server_name sethwahle.com www.sethwahle.com;
    root /var/www/sethwahle.com/webroot/RPG/www;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOL
sudo ln -sf /etc/nginx/sites-available/sethwahle.com /etc/nginx/sites-enabled/ \
sudo rm /etc/nginx/sites-enabled/default \

sudo ufw allow 'Nginx Full' \
sudo ufw allow 'Nginx HTTP' \
sudo ufw allow 'Nginx HTTPS' \
sudo ufw allow 'OpenSSH' \
sudo ufw enable
sudo nginx -t \
sudo systemctl reload nginx \