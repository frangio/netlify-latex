#!/usr/bin/env sh
IMAGE=blang/latex:ctanbasic
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" "$@"
