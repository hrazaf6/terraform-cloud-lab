#!/bin/bash
sudo apt update
sudo apt install apache2 -y
echo "Hello World" >> /var/www/html/index.html
