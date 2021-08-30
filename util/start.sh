#!/bin/sh
docker stack deploy --with-registry-auth -c docker-compose.yml es
sleep 3
./util/status.sh
