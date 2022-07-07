ARG BUILD_FROM="ghcr.io/home-assistant/aarch64-base-debian:bullseye"
FROM ${BUILD_FROM}

ENV PIP_FLAGS="--no-cache-dir"

# Install dependencies
RUN apt update && \
    apt install -y \
        --no-install-recommends \
        python3-minimal \
        nginx \
        python3-pip \
        python3-dev \
        git \
        gcc \
    && pip install ${PIP_FLAGS} aiohttp aiortc \
    && git clone https://github.com/aiortc/aiortc \
    && apt remove -y \
        python3-dev \
        git \
        gcc \
    && apt -y autoremove \
    && apt clean

# Copy root filesystem
COPY rootfs /

# Make files executable
RUN chmod +x /etc/cont-init.d/*.sh
RUN chmod +x /etc/services.d/*/*