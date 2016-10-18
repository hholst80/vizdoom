# WIP: Playing ViZDoom With Docker

The instructions below is for Ubuntu 16.04 LTS.

## Step 1: Install Docker Engine

Follow the instructions at https://docs.docker.com/engine/installation/linux/ubuntulinux/

Add yourself to the `docker` group:

    sudo usermod -a -G docker $(id -un)

TODO: Add instructions for custom DNS server used by Docker Engine.

## Step 2: Install NVIDIA Docker Plugin

Follow the instructions at https://github.com/NVIDIA/nvidia-docker

In Ubuntu 16.04 LTS you need to apply a fix:

    sudo mkdir /usr/local/nvidia-driver
    sudo chown nvidia-docker:nvidia-docker /usr/local/nvidia-driver

## Step 3: Build ViZDoom Docker Image

Either build the `vizdoom` image:

    docker build -t vizdoom .

or pull it from Docker Hub:

    docker pull frostbitelabs/vizdoom

## Step 4: Run ViZDoom

    nvidia-docker run -it --rm                         \
                      -e XAUTHORITY=/root/.Xauthority  \
                      -e DISPLAY                       \
		      -v /tmp/.X11-unix                \
		      -v $XAUTHORITY:/root/.Xauthority \
		      vizdoom
