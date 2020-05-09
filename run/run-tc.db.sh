#!/bin/sh

docker network ls | grep 'tc.internal'
[ $? -ne 0 ] && docker network create tc.internal

docker run --rm -dt \
  --mount 'type=volume,src=tc.db,dst=/var/lib/mysql' \
  --net=tc.internal \
  -p 3306:3306/tcp \
  tc.db
