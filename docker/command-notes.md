# Docker command notes

## 1) Basic
### Work with container
* **Run an container**
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

### Data volume
* **Run a docker with mounted volume**

*options -v = --volume*
```bash
# syntax
docker run [container] -v [host path]:[internal container path] [following command]

# case 1: create a container mounted volume without host path, host path will be generated random by docker
docker run --name demo -v /chest alpine touch /chest/coins

# case 2: create a container mounted volume with host path
docker run --name hi -v $(pwd)/host/dir:/data alpine touch /data/hi
# recheck to see file 'hi' created
docker rm hi
ls $(pwd)/host/dir

# Using inspect to check mounted info: Type, Source(host path), Destination(internal container path), Mode ...
docker inspect [container] # check key 'Mounts'
```

*inspect example*
```json
"Mounts": [
  {
      "Type": "bind",
      "Source": "/Users/user_name/projects/docker/host/dir",
      "Destination": "/data",
      "Mode": "",
      "RW": true,
      "Propagation": "rprivate"
  }
]

```
* **Share volume between containers**

*options --volume-from*
```bash
# create container name 'box' with volumn '/share-vol'
docker create --name box -v /share-vol alpine nop
# create container 'AA' and use shared volume from container 'box', add a file 'wine'
docker run --name AA --volumes-from box alpine touch /share-vol/wine
# create container 'BB' and use shared volume from container 'box', list files in shared volume '/share-vol'
docker run --name BB --volumes-from box alpine ls /share-vol
```

## 2) Distributing Images
*A registry is a service that stores, manages, and distributes images. We can use public services like [Docker Hub](https://hub.docker.com)(*default), [Quay](https://quay.io) or using your own host*

### Using a local registry
* ** Structure of image name **
`[registry/]image_name[:tag]`

*If you use `docker pull nginx`, it is equal `docker pull docker.io/alpine:latest`*

```bash
# Start a local registry
docker pull registry
docker run -p 5000:5000 registry # start a registry host at port 5000

# Using nginx image for demo
docker pull nginx
# Create a new image from nginx image with a local registry and version
docker tag nginx localhost:5000/comps/prod/nginx:1.15
# Push this image to the local registry
docker push localhost:5000/comps/prod/nginx:1.15

# Create a new image from nginx image with a local registry without version (= latest)
docker tag nginx localhost:5000/comps/prod/nginx
# Push this image to the local registry, all the layers are already on local registry, just create a new name. 
docker push localhost:5000/comps/prod/nginx
```




## 3) Basic
