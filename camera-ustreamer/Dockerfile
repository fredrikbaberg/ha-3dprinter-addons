ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base"
ARG JANUS_GATEWAY_VERSION="1.1.3"
ARG USTREAMER_VERSION="5.38"

FROM ${BUILD_FROM} AS builder
ARG JANUS_GATEWAY_VERSION
ARG USTREAMER_VERSION
ENV LANG C.UTF-8

# Janus
RUN apk add -U --virtual .build-deps-janus \
    build-base \
    autoconf \
    automake \
    libtool \
    libconfig-dev \
    glib-dev \
    libnice-dev \
    jansson-dev \
    openssl-dev \
    zlib-dev \
    libsrtp-dev \
    curl-dev \
    libogg-dev \
    libwebsockets-dev \
    libusrsctp-dev
RUN wget -qO- https://github.com/meetecho/janus-gateway/archive/v${JANUS_GATEWAY_VERSION}.tar.gz | tar xz -C /tmp
WORKDIR /tmp/janus-gateway-${JANUS_GATEWAY_VERSION}
RUN sh autogen.sh
RUN ./configure --prefix=/opt/janus
RUN make
RUN make install
RUN make configs

# Ustreamer
RUN apk add -U --virtual .build-deps-ustreamer \
        sed \
        build-base \
        libevent-dev \
        libbsd-dev \
        libjpeg-turbo-dev \
        musl-dev \
        alsa-lib-dev \
        speexdsp-dev \
        opus-dev \
        glib-dev \
        jansson-dev
RUN wget -qO- https://github.com/pikvm/ustreamer/archive/v${USTREAMER_VERSION}.tar.gz | tar xz -C /tmp
WORKDIR /tmp/ustreamer-${USTREAMER_VERSION}
RUN ln -s /opt/janus/include/janus /usr/include/janus
RUN sed --in-place --expression 's|^#include "refcount.h"$|#include "../refcount.h"|g' /usr/include/janus/plugins/plugin.h
RUN make WITH_PTHREAD_NP=0 WITH_JANUS=1
RUN make install
RUN mv janus/libjanus_ustreamer.so /opt/janus/lib/janus/plugins/libjanus_ustreamer.so

FROM ${BUILD_FROM} AS final
ENV LANG C.UTF-8

COPY --from=builder /opt/janus /opt/janus
COPY --from=builder /usr/local/bin/ustreamer /usr/local/bin/ustreamer

RUN apk add -U \
    alsa-lib \
    curl \
    glib \
    glib \
    jansson \
    jansson \
    libbsd \
    libconfig \
    libevent \
    libjpeg-turbo \
    libnice \
    libogg \
    libsrtp \
    libtool \
    libusrsctp \
    libwebsockets \
    musl \
    openssl \
    opus \
    speexdsp \
    zlib \
    caddy \
    vim \
    screen

COPY rootfs/ /

WORKDIR /

# # Make files executable
# RUN chmod +x /etc/cont-init.d/*.sh
# RUN chmod +x /etc/services.d/*/*
