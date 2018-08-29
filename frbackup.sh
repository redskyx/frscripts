#!/bin/bash
# Cheeky backups for light apps with no cron or backups, sorry!

apparray=(app1 app2 app3)
for i in ${apparray[@]}
do 
echo "--==Backing up $i==--"
DROPBOXDIR="$HOME/BACKUPS/"
if [ ! -d "$DROPBOXDIR/$i" ]; then
mkdir "$DROPBOXDIR$i"
fi 
PASS=$(ssh $(echo $i)@deploy.eu2.frbit.com printenv MYSQL_PASSWORD)
rsync -a $(echo $i)@deploy.eu2.frbit.com:~/ "$DROPBOXDIR$i" &&
ssh $(echo $i)@deploy.eu2.frbit.com mysqldump -h $(echo $i).mysql.eu2.frbit.com -u$(echo $i) -p$(echo $PASS) $(echo $i) > "$DROPBOXDIR$i"/$(echo $i)_backup.sql 
done
