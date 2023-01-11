ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base-debian:bullseye"
FROM ${BUILD_FROM}
ARG OCTOPRINT_VERSION="1.8.6"

# Setup path for persistent install of Python packages
ENV PYTHONPATH=/data/python/octoprint
ENV PYTHONUSERBASE=/data/python/octoprint
ENV PATH=/data/python/octoprint/bin:${PATH}
ENV OCTOPRINT_VERSION=${OCTOPRINT_VERSION}

# Preparation for install of Caddy
RUN apt update \
    && apt install -y \
    --no-install-recommends \
    debian-keyring \
    debian-archive-keyring \
    apt-transport-https \
    gpg \
    && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg \
    && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list

# Install dependencies
RUN apt update \
    && apt install -y \
        --no-install-recommends \
        python3-venv \
        python3-dev \
        python3-wheel \
        build-essential \
        caddy \
        # Extras.
        ffmpeg \
        # avrdude \
        # dfu-util \
        # dfu-programmer \
        # stm32flash \
        # Development/testing
        vim \
    && \
    apt clean

# Copy root filesystem
COPY rootfs /
RUN chmod +x /etc/cont-init.d/*.sh
RUN chmod +x /etc/services.d/*/*
RUN chmod +x /scripts/*.sh
