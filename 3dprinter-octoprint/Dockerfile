ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base-debian:bullseye"
FROM ${BUILD_FROM}
ARG OCTOPRINT_VERSION="1.8.1"

ENV OCTOPRINT_VERSION=${OCTOPRINT_VERSION}

# Setup path for persistent install of Python packages
ENV PYTHONPATH=/data/python/octoprint
ENV PYTHONUSERBASE=/data/python/octoprint
ENV PATH=/data/python/octoprint/bin:${PATH}

# Install dependencies
RUN apt update && \
    apt install -y \
        python3-venv \
        python3-dev \
        build-essential \
        nginx \
    && \
    apt install -y \
        vim \
    && \
    apt clean

# Remove nginx default site.
RUN rm /etc/nginx/sites-enabled/default

# Copy root filesystem
COPY rootfs /
RUN chmod +x /etc/cont-init.d/*.sh
RUN chmod +x /etc/services.d/*/*
