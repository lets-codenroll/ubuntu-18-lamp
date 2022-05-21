#!/bin/bash

sudo apt update

sudo apt install apache2

sudo ufw app list

sudo ufw app info "Apache Full"

sudo ufw allow "Apache Full"

printf "\033[32m >>> Apache Installation Completed!\n \033[0m"

sleep 3

sudo apt install mysql-server

sudo mysql_secure_installation

printf "\033[32m >>> MySQL Installation Completed!\n \033[0m"

sleep 3

sudo apt install curl php libapache2-mod-php php-mysql phpmyadmin php-mbstring php-gettext

sudo phpenmod mbstring

echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf

sudo systemctl restart apache2

printf "\033[32m >>> PHP & PhpMyAdmin Installations Completed!\n \033[0m"
