#!/bin/bash
sleep 30
echo "Starting docker installation at `date`" >> test.txt
curl -sSL https://get.docker.com/ | sh
echo "Completed docker installation at `date`" >> test.txt
echo "Starting docker container run at `date`" >> test.txt
docker run -e EULA=TRUE -d -p 25565:25565 --name mc itzg/minecraft-server
echo "Completed docker container run at `date`" >> test.txt