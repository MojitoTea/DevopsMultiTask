#!bin/bash
if [ -x "$(command -v nginx)" ]; then
  echo "Nginx already installed"
else 
  echo "Installing nginx..."
  sudo apt update
  sudo apt install nginx -y
  echo "Nginx Installed..."
fi
