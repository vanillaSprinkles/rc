#!/usr/bin/env bash

DOCKER=/usr/bin/docker

docker () {
  sudo "${DOCKER}" "$@"
}

