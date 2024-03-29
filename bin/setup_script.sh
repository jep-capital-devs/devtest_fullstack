#!/bin/bash

cd ..
composer install
php artisan key:generate
php artisan migrate
php artisan db:seed
php artisan voyager:install

clear
echo "===================="
echo "=== CREATE ADMIN ==="
echo "===================="
php artisan voyager:admin --create

clear
echo "==================="
echo "= FRONT-END TOOLS ="
echo "==================="
cd resources/views/themes/frostbite/assets
npm install && gulp css && gulp lintjs

clear
echo "============================"
echo "= SETTING FILE PERMISSIONS ="
echo "============================"
cd ../../../../..
find ./ -type f -exec chmod 664 {} \;
find ./ -type d -exec chmod 775 {} \;

clear
echo "INSTALL FINISHED. YOU CAN BEGIN WORKING NOW!"
