## Redis Dockerfile


This repository contains **Dockerfile** of [Redis](http://redis.io/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/dockerfile/redis/) published to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [dockerfile/ubuntu](https://github.com/dockerfile/ubuntu)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/dockerfile/redis/) from public [Docker Registry](https://index.docker.io/): `docker pull dockerfile/redis`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/redis" github.com/dockerfile/redis`)


### Usage

#### Run `redis-server`

    docker run -d -p 6379:6379 dockerfile/redis

#### Run `redis-cli`

    docker run -i -rm -t -entrypoint="redis-cli" dockerfile/redis
