FROM ubuntu:22.04

USER root
WORKDIR /root
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        git \
        build-essential \
        cmake \
        libuv1-dev \
        libssl-dev \
        libhwloc-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/xmrig/xmrig.git
RUN cd xmrig \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make

ENTRYPOINT ["./xmrig/build/xmrig"]

