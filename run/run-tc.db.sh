#!/bin/sh

docker run --rm -dt \
  --mount 'type=volume,src=tc.db,dst=/var/lib/mysql' \
  --net=tc.internal \
  tc.db
