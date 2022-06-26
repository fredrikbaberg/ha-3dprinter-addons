ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base-debian:bullseye"
FROM ${BUILD_FROM}
ARG OCTOPRINT_VERSION="1.8.1"

ENV OCTOPRINT_VERSION=${OCTOPRINT_VERSION}

# Setup path for persistent install of Python packages
ENV PYTHONPATH=/data/python/octoprint
ENV PYTHONUSERBASE=/data/python/octoprint
ENV PATH=${PATH}:/data/python/octoprint/bin

# Install dependencies
RUN apt update && \
    apt install -y \
        python3-venv \
        python3-dev \
        build-essential \
    && \
    apt clean

# Copy root filesystem
COPY rootfs /
