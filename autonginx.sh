#!bin/bash
if [ -x "$(command -v nginx)" ]; then
  echo "Nginx already installed"
else 
  echo "Installing nginx..."
  sudo apt update
  sudo apt install nginx -y
  echo "Nginx Installed..."
fi
nginx_page="/var/www/html/index.nginx-debian.html"
sudo chmod 777 "$nginx_page"
IP=$(hostname -I)
dat=$(date +%Y-%m-%d)
echo "$IP"
echo "$Changed"
echo "Hello World NGINX  $IP $dat " > "$nginx_page"
