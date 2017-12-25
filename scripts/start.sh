#!/bin/sh
traefik -c /etc/traefik/traefik.toml --logLevel=DEBUG --accesslogsfile=/dev/stdout