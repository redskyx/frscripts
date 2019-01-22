# Hack to allow ad hoc backups
if [ -n "$1" ]
then
apparray=($1);
else
apparray=()
fi
DOW=$(date +%u)
# If we try to run on tues or thursday bump back a day because dropbox can't cope with 5 days syncing
if [ $((DOW%2)) -eq 0 ];
then
	DOW=$(($DOW-1));
else
	DOW=$DOW;
fi
for i in ${apparray[@]}
do 
echo "--==Backing up $i to Backup $DOW==--"
DROPBOXDIR="$HOME/Dropbox (redsky)/Team Redsky/Websites/FortrabbitBackups/$DOW/"
if [ ! -d "$DROPBOXDIR$i" ]; then
mkdir "$DROPBOXDIR$i"
fi 
PASS=$(ssh $(echo $i)@deploy.eu2.frbit.com printenv MYSQL_PASSWORD)
rsync -a $(echo $i)@deploy.eu2.frbit.com:~/ "$DROPBOXDIR$i" &&
ssh $(echo $i)@deploy.eu2.frbit.com mysqldump -h $(echo $i).mysql.eu2.frbit.com -u$(echo $i) -p$(echo $PASS) $(echo $i) > "$DROPBOXDIR$i"/$(echo $i)_backup.sql 
done