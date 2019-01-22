#!/bin/bash

rsync -av  "$HOME/Dropbox (redsky)/Team Redsky/Websites/FortrabbitBackups/1/$1/" $1@deploy.eu2.frbit.com:~/ --delete 

