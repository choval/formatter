#!/bin/sh
cd "${0%/*}"
OLDCONTEXT=`docker context show`
docker context use default > /dev/null 2>&1
(docker buildx ls | grep multiarch) || docker buildx create --name multiarch --driver docker-container --use
docker buildx use multiarch
docker buildx build --pull --provenance=false --platform linux/amd64,linux/arm64 -t ghcr.io/choval/formatter:latest --push .
docker buildx stop
docker context use $OLDCONTEXT > /dev/null 2>&1
