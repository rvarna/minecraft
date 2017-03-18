#!/bin/bash
# Many a times, we see VMs in VMSS not being set up fully yet (pending investigation).
sleep 30
echo "Starting docker installation at `date`" >> log.txt
curl -sSL https://get.docker.com/ | sh
echo "Completed docker installation at `date`" >> log.txt

echo "Starting docker container run at `date`" >> log.txt
docker run -e EULA=TRUE -d -p 25565:25565 --name mc itzg/minecraft-server
echo "Completed docker container run at `date`" >> log.txt