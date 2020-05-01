# deno

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/aminnairi/deno)](https://hub.docker.com/r/aminnairi/deno) [![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/aminnairi/deno/latest)](https://hub.docker.com/r/aminnairi/deno) [![Docker Pulls](https://img.shields.io/docker/pulls/aminnairi/deno)](https://hub.docker.com/r/aminnairi/deno)

Docker image for Deno.

## Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/) (optional)

## Usage

### Docker

```console
$ docker run --rm --tty --interactive --user deno --workdir /home/deno --volume "$PWD":/home/deno aminnairi/deno:latest deno mod.ts
```

Where `mod.ts` is the script to run.

### Docker Compose

```console
$ vim docker-compose.yaml
```

```yaml
version: "3"

services:
    deno:
        image: aminnairi/deno:latest
        user: deno
        tty: true
        stdin_open: true
        workdir: /home/deno
        entrypoint: deno
        volumes:
            - .:/home/deno
```

```console
$ docker-composer run --rm deno mod.ts
```

Where `mod.ts` is the script to run.

## Shell alias

```console
$ alias deno='docker run --rm --tty --interactive --user deno --workdir /home/deno --volume "$PWD":/home/deno aminnairi/deno:latest deno'
$ echo 'console.log("Hello, world!");' > mod.ts
$ deno mod.ts
```

## GitHub Action

```console
$ mkdir -p .github/workflows/
$ touch .github/workflows/github_ci.yaml
```

```yaml
name: GitHub CI

on:
  push:
    branches:
      - latest

  pull_request:
    branches:
      - latest

jobs:
  test:

    runs-on: ubuntu-latest

    steps:
      - name: Checkout the repository
        uses: actions/checkout@v2

      - name: Test the module
        run: sudo docker run --rm --volume "$GITHUB_WORKSPACE":/home/deno aminnairi/deno:latest deno test
```
