#!/bin/sh

sleep 5

WEAVE_IP="$(ifconfig ethwe | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')"

/bin/consul agent -config-dir=/config -bind $WEAVE_IP $@ &

export CONSUL_PID=$!

/bin/consul join consul-server

wait $CONSUL_PID