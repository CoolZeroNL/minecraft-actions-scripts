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
    sudo rm -f $(sudo ls -1t /home/minecraft/backuped/$hostname | grep backup-world | grep $hostname | tail -n +11)
fi
