#!/bin/sh

/docker-entrypoint.sh
filebeat modules enable nginx
filebeat setup
service filebeat start
nginx -g 'daemon off;'