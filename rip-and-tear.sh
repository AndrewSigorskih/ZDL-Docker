#!/bin/bash

DOOMSAVEDIR="$HOME/games/doom/saves"
DOOMWADDIR="$HOME/games/doom/wads"

docker run -it -m 4096M --rm \
    -v ${DOOMWADDIR}:/wads -v ${DOOMSAVEDIR}:/saves \
    --device=/dev/snd --device=/dev/dri -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --privileged \
    zdl-docker zdl
