#!/bin/bash

hostname=${1:-''}
folder=${2:-''}
NOW=$(date +"%m-%d-%Y-%H-%M-%S")
FILE="backup-world.$NOW.$hostname.tar.gz"

sudo mkdir -p /home/minecraft/backuped/$hostname

sudo tar -czf /home/minecraft/backuped/$hostname/$FILE /home/minecraft/deployed/$folder/world
if [[ $? -ne 0 ]]
then
    echo "Something went wrong"
    exit 1
else
    echo "Job complete"
    
    # Remove all files more then 10 copies.
    rm -f $(ls -1t /home/minecraft/backuped/ | tail -n +11)
fi
