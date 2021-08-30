#!/bin/sh
echo "elastic search  service status"
docker service ls | grep es_
docker service ls | grep es_ | awk '{print $4}' | grep 0
while [ $? -eq 0 ]
do
     sleep 2
     docker service ls | grep es_
     docker service ls | grep es_ | awk '{print $4}' | grep 0
done
