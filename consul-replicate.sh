#!/bin/bash

CMD="docker run \
       --rm \
       --interactive \
       --tty \
       --net "host" \
       --user=$(id -u $(whoami)):$(id -g $(whoami)) \
       --volume $HOME:/home/developer \
       --volume $(pwd):/pwd \
       kurron/docker-consul-replicate:0.2.0"

#echo $CMD
eval $CMD $*
