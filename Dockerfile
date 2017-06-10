FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    unzip \
    make \
    build-essential \
    dnsutils \
    libyaml-dev \
    libpcre3-dev \
    libssl-dev \
    vim \
    luarocks && \
    apt-get clean

RUN luarocks install luafilesystem
RUN luarocks install formatter
RUN luarocks install checks

WORKDIR /tmp

ENTRYPOINT [ "luaformatter" ]

