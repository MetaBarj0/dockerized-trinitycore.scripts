#!/bin/sh

docker exec -it $(docker ps -q -f ancestor=tc.db) ash
