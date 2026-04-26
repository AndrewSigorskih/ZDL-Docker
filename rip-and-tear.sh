#!/bin/bash

DOOMSAVEDIR="$HOME/games/doom/saves"
DOOMWADDIR="$HOME/games/doom/wads"
ZDLCONFDIR="$HOME/games/doom/zdl-confs"

docker run -it -m 4096M --rm \
    -v ${DOOMWADDIR}:/wads \
    -v ${DOOMSAVEDIR}:/saves \
    -v ${ZDLCONFDIR}:/zdl-configs \
    -v ./gzdoom.ini:/home/player/.config/gzdoom/gzdoom.ini:ro \
    --device=/dev/snd \
    --device=/dev/dri \
    -v $XDG_RUNTIME_DIR/pulse:/run/user/$(id -u)/pulse \
    -e PULSE_SERVER=unix:/run/user/$(id -u)/pulse/native \
    -v ~/.config/pulse/cookie:/home/player/.config/pulse/cookie \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e SDL_VIDEODRIVER=wayland \
    -e QT_QPA_PLATFORM=wayland \
    -v $XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR \
    zdl-docker  bash\
    # zdl
