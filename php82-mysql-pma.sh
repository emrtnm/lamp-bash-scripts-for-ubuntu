#!/bin/sh
DIVIDER="\n########################################\n\n"

printf "Requirements are installing...\n"

sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get install software-properties-common apt-transport-https -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install wget nano screen unzip curl apache2 -y
sudo ufw allow in "Apache"
sudo ufw allow in "Apache Full"

sudo mkdir /var/www
sudo mkdir /var/www/html
sudo chown -R $USER:$USER /var/www
sudo chmod -R 775 /var/www
sudo rm -rf /var/www/html/index.html
sudo > /etc/apache2/apache2.conf
sudo cat ./apache2.conf >> /etc/apache2/apache2.conf
sudo echo "<?php phpinfo();" >> /var/www/html/index.php

printf $DIVIDER
printf "PHP8.2 is installing..."
printf $DIVIDER

sudo apt-get install php8.2 -y
sudo apt-get install php8.2-cli php8.2-gd php8.2-mysql php8.2-imap php8.2-curl php8.2-intl php8.2-pspell php8.2-sqlite3 php8.2-tidy php8.2-xmlrpc php8.2-xsl php8.2-zip php8.2-mbstring php8.2-soap php8.2-opcache php8.2-common php8.2-readline php8.2-xml -y

printf $DIVIDER
printf "PHP8.2 has been installed.\n"
printf $DIVIDER

printf $DIVIDER
printf "Mysql is installing...\n"
printf $DIVIDER

echo "Enter a new mysql password: \c"
read mysqlpasswd

sudo apt-get install mysql-server -y

sudo mysql -Bse "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$mysqlpasswd';"

mysql_secure_installation

printf $DIVIDER
printf "Mysql has been installed.\n"
printf $DIVIDER

printf $DIVIDER
printf "Phpmyadmin is installing...\n"
printf $DIVIDER

sudo wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.zip -O phpmyadmin.zip
sudo unzip phpmyadmin.zip
sudo rm phpmyadmin.zip
sudo mv phpMyAdmin-5.2.0-all-languages/ /usr/share/phpmyadmin
sudo chmod -R 755 /usr/share/phpmyadmin
sudo cat ./phpmyadmin.conf >> /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enmod rewrite
sudo a2enconf phpmyadmin
sudo systemctl reload apache2
sudo mkdir /usr/share/phpmyadmin/tmp/
sudo chown -R www-data:www-data /usr/share/phpmyadmin/tmp/

printf $DIVIDER
printf "Phpmyadmin has been installed.\n"
printf $DIVIDER

sudo systemctl start apache2
