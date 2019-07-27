# docker-lemp
Docker container for LEMP (Linux, Nginx, MySQL and PHP)

## Docker Commands

``` bash
# Build docker image from `Dockerfile`
$ docker build -t docker-lemp .

# List out available docker images
$ docker images

# Remove docker image
$ docker image rm docker-lemp

# Forcefully remove image
$ docker image rmi -f docker-lemp

# Run docker container from image
$ docker run -p 80:80 docker-lemp

# Run docker container from image and access container via SSH
$ docker run -t -i -p 80:80 docker-lemp /bin/bash

# List running docker containers
$ docker ps -a

# Stop running docker container
$ docker stop [Container ID]
```

