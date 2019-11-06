# Docker command notes

## 1) Basic
### Work with images and container
* **Run an image**
```bash
# run (will pull image if dont exist in local)
docker run [image] [following commands]
## example
### run command ls in a container build from alpine image
docker run alpine ls
docker run alpine ps aux
### run a custom script bash
docker run busybox /bin/sh -c "while :; do echo 'meow~'; sleep 1; done"
```

* **List/Remove images and containers**
```bash
# List all image
docker images
# List all running containers
docker ps
# List all containers
docker ps -a
# Remove image
docker rmi [image]
# Remove container
dockerrm [container]
```

* **Access into container**
*options -i = --interactive and -t = --tty*
```bash
# Access to an active container, start in a shell
docker exec -it [container] /bin/sh
# Start from an image, create docker then access
docker run -it [image]
```

## 1) Basic


## 1) Basic
