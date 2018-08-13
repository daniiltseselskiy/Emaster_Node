#!/bin/bash
sudo mkdir /var/www/proak-dota2
sudo chmod -R 755 /var/www/proak-dota2
cd /var/www/proak-dota2
npm install
sudo service dota2 restart
