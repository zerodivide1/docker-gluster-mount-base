# docker-gluster-mount-base
Base Docker image with a GlusterFS client installed to allow mounting a cluster running on Raspberry Pis.

## Background
I currently use HypriotOS on my Raspberry Pi cluster, which uses Raspbian's package repositories. Currently,
version 3.5.2 of GlusterFS Server is available to install on Raspberry Pis without compiling. Unfortunately,
current versions of GlusterFS client don't seem to work nicely with the 3.5.2 Server, making use difficult.

I've created this base image to try to help me mount GlusterFS volumes from inside a Docker container.

## Usage
The intent of this image is to be used as a base for something else. However, because the GlusterFS client
requires FUSE, any container running this image requires escalated privileges.

```
sudo docker run -ti --rm --privileged --cap-add SYS_ADMIN --cap-add MKNOD --device=/dev/fuse zerodivide1/docker-gluster-client-base /bin/bash
```

Inside the container you can issue the commands to mount the GlusterFS cluster inside the container:

```
mount -t glusterfs <Gluster host>:/<volume> <mount point>
```

