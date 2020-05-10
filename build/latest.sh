#!/bin/sh

VERSION=1.0.0-rc2

docker build --build-arg VERSION=$VERSION --rm --pull --no-cache --force-rm --compress --tag aminnairi/deno:latest --file ./docker/Dockerfile . \
    && docker push aminnairi/deno:latest \
    && docker rmi -f aminnairi/deno:latest
