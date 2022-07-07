ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base-debian:bullseye"
FROM ${BUILD_FROM}

ENV PIP_FLAGS="--no-cache-dir"

# Install dependencies
RUN apt update && \
    apt install -y \
        --no-install-recommends \
        python3-pip \
        git \
        nginx \
    && pip install aiohttp aiortc \
    && git clone https://github.com/aiortc/aiortc \
    && apt remove -y git \
    && apt clean

# Copy root filesystem
COPY rootfs /
