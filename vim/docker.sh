#!/bin/bash

docker stop vim
docker rm vim
docker run --name=vim -it -v/$PWD:/disk ubuntu bash -c '/disk/init.sh'
