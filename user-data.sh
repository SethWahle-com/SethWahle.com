#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt install nginx -y
sudo apt install certbot python3-certbot-nginx -y

sudo systemctl enable nginx
sudo systemctl start nginx

sudo git clone https://github.com/SethWahle-com/SethWahle.com.git /var/www/sethwahle.com
sudo chown -R $USER:$USER /var/www/sethwahle.com
sudo chmod -R 755 /var/www/sethwahle.com/www

sudo echo "server {" > /etc/nginx/sites-available/sethwahle.com
sudo echo "    listen 80;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    listen [::]:80;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    server_name sethwahle.com www.sethwahle.com;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    root /var/www/sethwahle.com/www;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    index index.html;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    location / {" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "        try_files \$uri \$uri/ =404;" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "    }" >> /etc/nginx/sites-available/sethwahle.com
sudo echo "}" >> /etc/nginx/sites-available/sethwahle.com

sudo ln -sf /etc/nginx/sites-available/sethwahle.com /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default

sudo ufw allow 'Nginx Full'
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw allow 'OpenSSH'
sudo ufw --force enable

sudo nginx -t
sudo systemctl reload nginx

# Obtain SSL certificate
sudo certbot --nginx \
    --non-interactive \
    --agree-tos \
    --email seth@sethwahle.com \
    -d sethwahle.com \
    -d www.sethwahle.com \
    --redirect

# Add cron job for automatic renewal
echo "0 0 * * * /usr/bin/certbot renew --quiet" | sudo tee -a /var/spool/cron/crontabs/root