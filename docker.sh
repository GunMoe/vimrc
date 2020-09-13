#!/bin/bash

docker stop vim
docker rm vim
docker run --name=vim -it -v/$PWD:/disk ubuntu /bin/bash
#docker exec -d vim ./disk/docker_init.sh
