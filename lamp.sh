#!/bin/sh
DIVIDER="\n########################################\n\n"

printf $DIVIDER
printf "# Emo PHP Environment Installer! #\n"
printf $DIVIDER

echo "Select a package for install"
echo "0 = PHP5.6 + MySQL8"
echo "1 = PHP7.4 + MySQL8"
echo "2 = PHP7.4 + MySQL8 + PhpMyAdmin5.2"
echo "3 = PHP8.1 + MySQL8"
echo "4 = PHP8.1 + MySQL8 + PhpMyAdmin5.2"
echo "5 = PHP5.6 + MySQL5.7"
echo "6 = PHP5.6 + MySQL5.7 + PhpMyAdmin4.9"
echo "7 = Add Domain"
echo "8 = Remove Domain"
echo "9 = Repair Chmod For Domain"
echo "10 = PHP8.2 + MySQL8"
echo "11 = PHP8.2 + MySQL8 + PhpMyAdmin5.2"
echo "99 = Remove All Components!"
echo $DIVIDER
echo "Please select a package number: "
read packname

if [ "$packname" = 0 ]
then
  chmod +x php56-mysql.sh
  ./php56-mysql.sh
fi

if [ "$packname" = 1 ]
then
  chmod +x php7-mysql.sh
  ./php7-mysql.sh
fi

if [ "$packname" = 2 ]
then
  chmod +x php7-mysql-pma.sh
  ./php7-mysql-pma.sh
fi

if [ "$packname" = 3 ]
then
  chmod +x php8-mysql.sh
  ./php8-mysql.sh
fi

if [ "$packname" = 4 ]
then
  chmod +x php8-mysql-pma.sh
  ./php8-mysql-pma.sh
fi

if [ "$packname" = 5 ]
then
  chmod +x php56-mysql5.sh
  ./php56-mysql5.sh
fi

if [ "$packname" = 6 ]
then
  chmod +x php56-mysql5-pma.sh
  ./php56-mysql5-pma.sh
fi

if [ "$packname" = 7 ]
then
  chmod +x add-host.sh
  ./add-host.sh
fi

if [ "$packname" = 8 ]
then
  chmod +x remove-host.sh
  ./remove-host.sh
fi

if [ "$packname" = 9 ]
then
  chmod +x repair-host.sh
  ./repair-host.sh
fi

if [ "$packname" = 10 ]
then
  chmod +x php82-mysql.sh
  ./php82-mysql.sh
fi

if [ "$packname" = 11 ]
then
  chmod +x php82-mysql-pma.sh
  ./php82-mysql-pma.sh
fi

if [ "$packname" = 99 ]
then
  chmod +x all-remove.sh
  ./all-remove.sh
fi

printf $DIVIDER
printf "Processes completed.\n"
printf $DIVIDER
