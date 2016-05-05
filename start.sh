#!/bin/sh

sleep 2

WEAVE_IP="$(ifconfig ethwe | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')"

exec /bin/consul agent -server -config-dir=/config -data-dir /data -bind $WEAVE_IP $@