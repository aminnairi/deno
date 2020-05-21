# Contributing

## Requirements

- [Git](https://git-scm.com/)
- Shell
- [Docker](https://www.docker.com/)

## Installation

```console
$ git clone https://github.com/aminnairi/deno.git
$ cd deno
```

## Update

Append changes to the [`Dockerfile`](./docker/Dockerfile).

## Build

```console
$ docker build --tag aminnairi/deno:$VERSION --file docker/v$VERSION/Dockerfile --compress --force-rm --no-cache --progress tty --pull --rm .
```

Where `$VERSION` is the version to build.

## Test

```console
$ docker run aminnairi/deno:$VERSION deno --version
```

## Push

```console
$ docker login
$ docker push aminnairi/deno:$VERSION
```

## Uninstall

```console
$ docker rmi -f aminnairi/deno:$VERSION
```

## Build & publish (old versions)

```console
$ docker login
$ sh build/old.sh       # for all the versions using the old installer
```
