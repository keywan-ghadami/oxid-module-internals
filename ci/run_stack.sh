#!/usr/bin/env bash
: "${OXID:=6.1}"
echo $OXID
# exporting the variable is important otherwise interpolation in the compose file did not work resulting fallback to the root user
export UID
export GID="$(id -g $(whoami))"
docker swarm init
docker stack deploy --compose-file ci/docker-stack.yml oxid