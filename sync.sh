#!/bin/bash

# uses rsync to sync two folders, except this script
# is obsolete, because syncthing exists

IP_ADDR="192.168.1.155"
REMOTE_PATH="/home/elias/Documents"
LOCAL_PATH="/home/elias/Documents/debian-server"

if [[ $1 == 'pull' ]] || [[ $1 == 'download' ]] || [[ $1 == 'down' ]]; then
    echo pulling
    rsync \
        -r "elias@${IP_ADDR}:${REMOTE_PATH}/" \
        "${LOCAL_PATH}/"
elif [[ $1 == 'push' ]] || [[ $1 == 'upload' ]] || [[ $1 == 'up' ]]; then
    echo pushing
    echo WARNING: This is a potentially destructive action! [N/y]
    read continue_option

    if [[ ${continue_option,,} == 'y' ]]; then
        echo pushing
        rsync \
            --exclude 'sync.sh' \
            -r "${LOCAL_PATH}/" \
            "elias@${IP_ADDR}:${REMOTE_PATH}/"
    else
        echo ABORTED PUSH
    fi
else
    echo "Please choose either 'pull' or 'push' option"
fi
