# deno

Docker image for Deno.

## Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/) (optional)

## Usage

### Docker

```console
$ docker run --rm --user deno --workdir /home/deno --volume "$PWD":/home/deno aminnairi/deno deno mod.ts
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
        image: aminnairi/deno
        user: deno
        workdir: /home/deno
        entrypoint: deno
        volumes:
            - .:/home/deno
```

```console
$ docker-composer run --rm deno mod.ts
```

Where `mod.ts` is the script to run.

## Installation

### Hub Docker

```console
$ docker pull aminnairi/deno
```

### Manual

#### Requirements

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)

#### Installation

```console
$ git clone https://github.com/aminnairi/deno.git
$ cd deno
$ make install
```

#### Uninstallation

```console
$ make uninstall
```

## Shell alias

```console
$ alias deno='docker run --rm --user deno --workdir /home/deno --volume "$PWD":/home/deno aminnairi/deno deno'
$ deno mod.ts
```

## GitHub Action

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
        run: sudo docker run --rm --volume "$GITHUB_WORKSPACE":/home/deno aminnairi/deno deno test
```
