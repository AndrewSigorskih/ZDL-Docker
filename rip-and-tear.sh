#!/bin/bash

DOOMSAVEDIR="$HOME/games/doom/saves"
DOOMWADDIR="$HOME/games/doom/wads"

docker run -it -m 4096M --rm \
    -v ${DOOMWADDIR}:/wads \
    -v ${DOOMSAVEDIR}:/saves \
    --device=/dev/snd \
    --device=/dev/dri \
    -v $XDG_RUNTIME_DIR/pulse:/run/user/$(id -u)/pulse \
    -e PULSE_SERVER=unix:/run/user/$(id -u)/pulse/native \
    -v ~/.config/pulse/cookie:/home/player/.config/pulse/cookie \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=/home/player/.Xauthority \
    -v $HOME/.Xauthority:/home/player/.Xauthority:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    zdl-docker zdl
