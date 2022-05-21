# Ubuntu 18 LAMP Quick Installation with Bash

This project includes bash scripts for quick install of LAMP.

What it does?
=======
- Install Apache2
- Install MySQL and configure the security details
- Install php, phpmyadmin and more:
  - libapache2-mod-php
  - php-mysql
  - curl
- It fix the "Not Found" issue of phpmyadmin


Another bash scripts included:
=======
- The WordPress bash file is the same as the main one only this one also installing WP-CLI

What you should do after running those scripts?
=======
1. Open 'dir.conf' file:
sudo nano /etc/apache2/mods-enabled/dir.conf
2. Replace these line: 
DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm

With this line: 
DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm

----
3. Enter MySQL:
sudo mysql
4. Configure the root password (change the word 'password' with yours):
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
5. Flush priviliges:
FLUSH PRIVILEGES;
6. Exit MySQL with typing the command 'exit'.
----
7. Create the directory for your_domain as follows:
sudo mkdir /var/www/your_domain
8. Assign ownership of the directory with the $USER environment variable, which references the current logged user:
sudo chown -R $USER:$USER /var/www/your_domain
----
9. Create a new apache conf file for your domain:
sudo nano /etc/apache2/sites-available/your_domain.conf
10. Paste this (edit what necessary):
<VirtualHost *:80>
    ServerAdmin your@email.com
    ServerName your_domain.com
    ServerAlias www.your_domain.com
    DocumentRoot /var/www/your_domain
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

        <Directory /var/www/your_domain>
            Options Indexes FollowSymLinks MultiViews
            AllowOverride All
            Require all granted
    </Directory>
</VirtualHost>
11. Add your website and restart apache:
sudo a2ensite your_domain.conf && sudo systemctl restart apache2

=====

Provided by Amit Moreno from Codenroll
