FROM gliderlabs/consul:0.6

ADD . /config

VOLUME /data

ENTRYPOINT ["/config/start.sh"]