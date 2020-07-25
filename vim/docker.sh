#!/bin/bash

docker stop vim
docker rm vim
docker run --name=vim -d -it -v/$PWD:/disk ubuntu 
docker exec -d vim ./disk/docker_init.sh
