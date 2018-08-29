# fmke_client
![Erlang Version](https://img.shields.io/badge/Erlang%2FOTP-21-brightgreen.svg)
[![Build Status](https://travis-ci.org/goncalotomas/fmke_client.svg?branch=master)](https://travis-ci.org/goncalotomas/fmke_client)

This repository contains client code for the [FMKe][fmke] benchmark. The client is available as a fork of
[Lasp Bench][lasp_bench], a Workload Generation tool written in Erlang.

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

[fmke]: https://github.com/goncalotomas/FMKe
[lasp_bench]: https://github.com/lasp-lang/lasp_bench
[fmke_docs]: https://github.com/goncalotomas/FMKe/wiki
