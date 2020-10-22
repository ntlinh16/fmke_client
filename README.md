# fmke_client
![Erlang Version](https://img.shields.io/badge/Erlang%2FOTP-21-brightgreen.svg)
[![Build Status](https://travis-ci.org/goncalotomas/fmke_client.svg?branch=master)](https://travis-ci.org/goncalotomas/fmke_client)

This repository contains client code for the [FMKe][fmke] benchmark. The client is available as a fork of
[Lasp Bench][lasp_bench], a Workload Generation tool written in Erlang.

# 1. Work with your environment

## Build
To compile fmke_client you can run the following command:

```sh
rebar3 escriptize
```

This will download dependencies and generate a `lasp_bench` binary.

## Run
You will find a `fmke_client.config` file under `examples` that should be configured with the IP addresses and
corresponding ports of your running FMKe nodes.

After ensuring you have a correct configuration file you can start the client by running:

```sh
./_build/default/bin/lasp_bench examples/fmke_client.config
```

Note that you might require more than one instance of the client running at the same time in order to achieve maximum
throughput on your database system. Refer to the [FMKe documentation][fmke_docs] for further instructions on achieving
this.

## Getting Results
You can run `make results` to generate throughput and latency plots for a single client, but other utilities will be
made available to allow the merging of results of multiple clients into a single, global result. Refer to the
[FMKe documentation][fmke_docs].

# 2. Work with Docker container

## Build
Everything is packaged in a Docker image, you just need to get one

You can built the Docker image locally:
```
git clone https://github.com/ntlinh16/fmke_client
cd fmke_client/
docker build -t fmke_client:local .
```
or get the image from the docker hub:
```
docker pull ntlinh/fmke_client:latest
```
Please remember provide the correct image name to run a Docker container in the next Section

## Run a fmke_client container

First, you have to have a FMKe app server is running and you already populated data for the database. If not, please see the tutorial in [FMKe][fmke] and [fmke populator][fmke_pop] to run them all.

Then, you should modify the `fmke_client.config` file with your reuirements. An example of the config file can be found in [exemples folder](https://github.com/ntlinh16/fmke_client/blob/master/examples/).

Finally, you start a `fmke_clinet` docker with this config file to benchmark the database:

```
docker run -v  /fmke_client/exemples/fmke_client.config:/fmke_client/fmke_client.config --name fmke_client -h fmke_client fmke_client:local
```
## Getting Results


[fmke]: https://github.com/ntlinh16/FMKe
[fmke_pop]: https://github.com/ntlinh16/fmke_populator
[lasp_bench]: https://github.com/lasp-lang/lasp_bench
[fmke_docs]: https://github.com/goncalotomas/FMKe/wiki
