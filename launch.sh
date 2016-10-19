#!/bin/bash

function finish {
    rm -f "$XAUTH"
}

XAUTH="$(mktemp -p $HOME -t .Xauth.XXXX)"

trap finish EXIT

xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

nvidia-docker run -it --rm                         \
		  --device /dev/snd:/dev/snd       \
                  -e DISPLAY                       \
                  -e XAUTHORITY=/root/.Xauthority  \
                  -v /tmp/.X11-unix:/tmp/.X11-unix \
                  -v $XAUTH:/root/.Xauthority      \
                  -v $HOME/.config/vizdoom:/root/.config/vizdoom \
                  frostbitelabs/vizdoom
