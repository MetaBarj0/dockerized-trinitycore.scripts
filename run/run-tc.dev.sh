#!/bin/sh

docker network ls | grep 'tc.internal'
[ $? -ne 0 ] && docker network create tc.internal

docker run \
  --mount 'type=volume,src=tc.source,dst=/home/tc/source' \
  --mount 'type=volume,src=tc.build,dst=/home/tc/build' \
  --mount 'type=volume,src=tc.install,dst=/home/tc/install' \
  --mount 'type=volume,src=tc.data,dst=/home/tc/data' \
  --mount 'type=bind,src=/home/docker/WoW-3.3.5a-12340,dst=/home/tc/client' \
  --rm -dt \
  --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
  --net=tc.internal \
  -p 3724:3724/tcp \
  -p 8085:8085/tcp \
  tc.dev
