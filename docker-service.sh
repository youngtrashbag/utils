#!/bin/bash

NAME=""
CONTAINER_NAME=""

start () {
    docker run -d \
        --name "${NAME}" \
        "${CONTAINER_NAME}"
}

reload () {
    docker restart "${NAME}"
}

stop () {
    docker stop "${NAME}"
    docker rm "${NAME}"
}


if [ "$1" == "start" ] || [ "$1" == "up" ]; then
    start
elif [ "$1" == "restart" ] || [ "$1" == "reload" ]; then
    reload
elif [ "$1" == "stop" ] || [ "$1" == "shutdown" ]; then
    stop
else
    echo use start, restart or stop as argument
fi

