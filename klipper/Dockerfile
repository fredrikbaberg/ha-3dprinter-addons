ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base"

FROM ${BUILD_FROM}

WORKDIR /root

RUN apk add --no-cache \
        git \
        py3-virtualenv \
        python3-dev \
        libffi-dev \
        build-base \
        curl-dev \
        caddy

COPY rootfs /
RUN chmod +x /etc/cont-init.d/*.sh
RUN chmod +x /etc/services.d/*/*
