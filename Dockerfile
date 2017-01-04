FROM ubuntu:14.04.3
MAINTAINER Sean Payne <spayne@seanpayne.name>

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:gluster/glusterfs-3.5 && \
    apt-get update && \
    apt-get install -y glusterfs-client=3.5.9-ubuntu1~trusty1 && \
    apt-get remove --purge software-properties-common && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
