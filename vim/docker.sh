#!/bin/bash

docker stop vim
docker rm vim
docker run --name=vim -it -v/dounait/docker:/disk ubuntu 
