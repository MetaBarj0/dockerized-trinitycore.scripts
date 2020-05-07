FROM alpine

RUN apk add --no-cache \
  openssh \
  git \
  vim \
  boost \
  boost-dev \
  mariadb \
  mariadb-client \
  mariadb-dev \
  openssl \
  cmake \
  zlib \
  g++ \
  gdb \
  ninja \
  readline \
  readline-dev \
  bzip2 \
  bzip2-dev \
  busybox-extras

RUN adduser -h /home/tc -D tc tc
RUN mkdir /home/tc/.ssh
RUN chown tc:tc /home/tc/.ssh && chmod 0700 /home/tc/.ssh

ARG SSH_SECRET_KEY
ARG SSH_PUBLIC_KEY

RUN [ -z "$SSH_SECRET_KEY" ] \
    && ( echo $'\n============================================================' \
         && echo 'Missing ssh key definition in SSH_SECRET_KEY build argument.' \
         && echo $'============================================================\n' \
         && exit 1 ) \
    || exit 0

RUN [ -z "$SSH_PUBLIC_KEY" ] \
    && ( echo $'\n============================================================' \
         && echo 'Missing ssh key definition in SSH_PUBLIC_KEY build argument.' \
         && echo $'============================================================\n' \
         && exit 1 ) \
    || exit 0

RUN echo "${SSH_SECRET_KEY}" > /home/tc/.ssh/id_rsa \
    && echo "${SSH_PUBLIC_KEY}" > /home/tc/.ssh/id_rsa.pub

RUN chown tc:tc /home/tc/.ssh/* && chmod 0600 /home/tc/.ssh/*

RUN mkdir -p /home/tc/source \
    && mkdir -p /home/tc/build \
    && mkdir -p /home/tc/install \
    && mkdir -p /home/tc/data \
    && mkdir -p /home/tc/client \
    && chown -R tc:tc /home/tc

VOLUME [ "/home/tc/source", "/home/tc/build", "/home/tc/install", "/home/tc/data", "/home/tc/client" ]

EXPOSE 3724/tcp
EXPOSE 8085/tcp

WORKDIR /home/tc
USER tc

LABEL maintainer=troctsch.cpp@gmail.com
