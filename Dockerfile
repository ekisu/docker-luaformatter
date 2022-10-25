FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN sed --in-place --regexp-extended "s/(\/\/)(archive\.ubuntu)/\1br.\2/" /etc/apt/sources.list
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
    luarocks \
    git \
    ca-certificates \
    cmake && \
    apt-get clean

RUN luarocks install --server=https://luarocks.org/dev lua-format

WORKDIR /code

ENTRYPOINT [ "lua-format" ]

