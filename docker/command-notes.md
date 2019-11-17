# Docker command notes

> Table of contents
> * [3) Connecting containers with networks](#3-connecting-containers)

## 1 - Basic
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

## 2 - Distributing Images
> *A registry is a service that stores, manages, and distributes images. We can use public services like [Docker Hub](https://hub.docker.com)(default), [Quay](https://quay.io) or using your own host*

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
# Push this image to the local registry, all the layers are already on local registry,
# just create a new image from exiting referrence
docker push localhost:5000/comps/prod/nginx
```
notes: some registries requires authentication `docker login`

### Distributing images
```bash
# Commits the changes of the container layer into a new image
docker commit [container]
# Saves one or  more images to a TAR archive
docker save --output [filename_path] IMAGE1 IMAGE2 IMAGEn
# Load a tar image into the local repository
docker load -i [filename_path]
# exports a container's filesystem as a tar archive = an image
docker export --output [filename_path] [container]
# import an image from an exported Tar archive
docker import [filename_path]
```
### Relationship of states between containers and image
![](assets/images/states_between_images_and_containers.png?raw=true)


## 3) Connecting containers with networks <a name="3-connecting-containers">
### Default networks
> *There are three kinds of networks to manage communications between containers and the hosts, namely `bridge`, `host` and `none`*

```bash
docker network ls

NETWORK ID          NAME                DRIVER              SCOPE
8bb41db6b13e        bridge              bridge              local (default)
4705332cb39e        host                host                local
75ab6cbbbbac        none                null                local
```

#### The `bridge` network
> By default, every container is connected to the `bridge` network upon creation. In mode `bridge`, every container is allocated a virtual interface as well as a private IP address, and the traffic going through the interface is bridged to the host's `docker0` interface. Containers within the same bridge network can also connect to each other via their IP address.

**Example:**
*command `nc -lp 5000` to listen inbound connections in port 5000*
```bash
# Create one container that's feeding a short message over port 5000, and observe its configuration
docker run --name greeter -d --expose 5000 busybox /bin/sh -c "echo Welcome stranger! | nc -lp 5000"
# check ip configuration info
docker exec greeter ifconfig
#eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:02
#          inet addr:172.17.0.2  Bcast:172.17.255.255  Mask:255.255.0.0

# Send a request to 'greeter'
docker run -t busybox telnet 172.17.0.2 5000
#Connected to 172.17.0.2
#Welcome stranger!
#Connection closed by foreign host

```

#### The `host` network
> The `host` network works as it's name suggets. Every connected container shares the host's network.

**Example:**
```bash
docker run -d --expose 5000 --network host busybox /bin/sh -c "echo im a container | nc -lp 5000"
# telnet localhost 5000
```

#### The `none` network
> The `none` network is a logically air-gapped box. Regardless of ingress or egress, traffic is isolated inside as there's no network interface attached to the container.
### Custom networks
**Create a custom network**

```bash
# Command to create a network
docker network create [NW-name]
```

#### Example: check connect between containers in a custome network
```bash
# Create a network called 'room'
docker network create room

# run a container with the name 'sleeper' and an alias 'dad' in the network 'room'
docker run -d --network room --network-alias \
 --name sleeper busybox sleep 60

# ping the container with its name 'sleeper' from another container
docker run --network room busybox ping -c 1 sleeper

# ping the container with its alias 'dad', it also works
docker run --network room apline ping -c 1 dad
```


## 4) Basic
