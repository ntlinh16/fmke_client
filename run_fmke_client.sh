#!/bin/bash

/fmke_client/_build/default/bin/lasp_bench /fmke_client/fmke_client.config

cp -rL /fmke_client/tests/current /results/$(uname -a | awk '{print $2}')