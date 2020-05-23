#!/bin/sh

docker kill $(docker ps -q -f ancestor=tc.dev)
