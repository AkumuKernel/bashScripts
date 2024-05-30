#!/bin/bash

# Detener y eliminar todos los contenedores
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# Eliminar todas las imágenes
docker rmi $(docker images -aq)

# Limpiar volúmenes
docker volume prune -f

# Limpiar redes
docker network prune -f
