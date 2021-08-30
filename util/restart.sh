#!/bin/sh
./util/stop.sh
x=2
while (($x > 1)) 
do 
  sleep 3
  x=$(docker service ls | grep es_ | wc -l)
done
sleep 3
./util/start.sh
