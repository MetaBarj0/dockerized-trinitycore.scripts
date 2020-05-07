#!/bin/sh

docker build \
  --tag tc.dev \
  --build-arg SSH_SECRET_KEY="$(cat ~/.ssh/id_rsa)" \
  --build-arg SSH_PUBLIC_KEY="$(cat ~/.ssh/id_rsa.pub)" .
