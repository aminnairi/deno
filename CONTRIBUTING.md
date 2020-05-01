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

## Staging

```console
$ docker build --tag aminnairi/deno:staging --file docker/Dockerfile .
```

## Test

```console
$ docker run aminnairi/deno:staging deno --version
```

## Uninstall

```console
$ docker rmi -f aminnairi/deno:staging
```

## Build & publish

```console
$ docker login
$ sh build/latest.sh    # for the latest version
$ sh build/main.sh      # for all the current versions
$ sh build/old.sh       # for all the versions using the old installer
```
