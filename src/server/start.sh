#!/bin/bash

docker pull nginx:latest
docker run --name nginx -d --net=bridge -p 81:81 nginx
docker cp nginx.conf nginx:/etc/nginx
docker cp server.c nginx:/etc/nginx
docker exec nginx apt-get update
docker exec nginx apt-get install -y gcc spawn-fcgi libfcgi-dev
docker exec nginx gcc -o /etc/nginx/server /etc/nginx/server.c -lfcgi
docker exec nginx spawn-fcgi -p 8080 /etc/nginx/server
docker exec nginx nginx -t
docker exec nginx nginx -s reload