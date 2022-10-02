ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base-debian:bullseye"
FROM ${BUILD_FROM}
ARG OCTOPRINT_VERSION="1.8.2"
ARG XDG_CONFIG_HOME="/data/config"
ARG XDG_DATA_HOME="/data/config"

ENV OCTOPRINT_VERSION=${OCTOPRINT_VERSION}
ENV XDG_CONFIG_HOME=${XDG_CONFIG_HOME}
ENV XDG_DATA_HOME=${XDG_DATA_HOME}

# Setup path for persistent install of Python packages
ENV PYTHONPATH=/data/python/octoprint
ENV PYTHONUSERBASE=/data/python/octoprint
ENV PATH=/data/python/octoprint/bin:${PATH}

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
        # ffmpeg \
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
