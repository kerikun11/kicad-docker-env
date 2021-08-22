#!/bin/sh

## Run
docker run --rm --interactive --tty \
    --network host \
    --volume $(pwd):/workspace \
    --workdir /workspace \
    --user $(id -u):$(id -g) \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --env DISPLAY \
    --volume $HOME/.Xauthority:$HOME/.Xauthority:ro \
    --group-add video \
    --tmpfs $HOME \
    kicad:4 \
    kicad "$@"
