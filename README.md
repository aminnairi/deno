# deno

Docker image for Deno.

## Usage

### Docker

```console
$ docker run --rm --volume "$PWD":/home/deno aminnairi/deno mod.ts
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
