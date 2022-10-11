#!bin/bash
#Check NGINX
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
echo "Hello World NGINX  $IP $dat " > "$nginx_page"
for i in $( cat userlist.txt ); do
    sudo useradd $i
    echo "user $i added successfully!"
    echo $i:$i"123" | chpasswd
    echo "Password for $i changed successfully"
done
#Telegram Send
curl -s "https://api.telegram.org/bot$API_KEY/sendMessage?chat_id=$CHAT_ID&text=helloworld $IP and $dat"

$API_KEY = the access token from Step 1
$CHAT_ID = the chat id from step 2

#HealthCHek NGINX
curl -o /dev/null -s -w "%{http_code}\n" http://localhost


