#!/bin/bash

rsync -av  "$HOME/Dropbox (redsky)/Team Redsky/Websites/FortrabbitBackups/1/$1/" $1@deploy.eu2.frbit.com:~/ --delete &&
PASS=$(ssh $(echo $1)@deploy.eu2.frbit.com printenv MYSQL_PASSWORD)

ssh $(echo $1)@deploy.eu2.frbit.com "mysql -h  $(echo $1).mysql.eu2.frbit.com -u $(echo $1) -p$PASS $(echo $1) <  /srv/app/$(echo $1)/htdocs/$(echo $1)_backup.sql > output.log"

