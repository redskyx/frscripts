#!/bin/bash

rsync -av  ./ $1@deploy.us1.frbit.com:~/ --delete