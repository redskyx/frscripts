#!/bin/bash

rsync -av  ./ $1@deploy.eu2.frbit.com:~/ --delete