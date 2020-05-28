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
