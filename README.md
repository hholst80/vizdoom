# WIP: Playing ViZDoom With Docker

The instructions below is for Ubuntu 16.04 LTS.

## Step 1: Install Docker Engine

Follow the instructions at https://docs.docker.com/engine/installation/linux/ubuntulinux/

Add yourself to the `docker` group:

    sudo usermod -a -G docker $(id -un)

## Step 2: Install NVIDIA Docker Plugin

Follow the instructions at https://github.com/NVIDIA/nvidia-docker

In Ubuntu 16.04 LTS you need to apply a fix:

    sudo mkdir /usr/local/nvidia-driver
    sudo chown nvidia-docker:nvidia-docker /usr/local/nvidia-driver

## Step 3: Build ViZDoom Docker Image

Either build the `vizdoom` image:

    docker build -t frostbitelabs/vizdoom .

or (faster unless you are on dial-up) pull it from Docker Hub:

    docker pull frostbitelabs/vizdoom

## Step 4: Run ViZDoom

Just run the script:

    ./launch.sh

# QA

## There is no music

Don't worry about it. The music in Freedoom kind of sucks. If you don't believe
me you can enable it in Options> Sound Options> Midi Device and selecting
Fluidsynth.

## I have an old NVIDIA graphics card and NVIDIA droppped support for it!

It our own fault. We should upgrade our GPUs. 
...or...
NVIDIA should appreciate that games built their fortune and help us out. ;-)

http://stackoverflow.com/questions/40117277/running-nvidia-docker-with-nouveau-graphics-drivers

## I am not as awesome as I used to be at Doom. Help!

No worries. `idkfa` and `iddqd` still works. What did you expect? :-)

## idkfa? iddqd? what are you talking about?

I bet you have a really high score at Candy crush saga?
