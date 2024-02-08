ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base"
FROM ${BUILD_FROM}

# Setup path for persistent install of Python packages
ENV ADDON_CONFIG_PATH=/config
ENV ADDON_SRC_PATH=/config/src
ENV ADDON_VENV_PATH=/config/python


# Install required packages
RUN apk add -U \
        # Proxy
        caddy \
        # Common
        git \
        py3-virtualenv \
        iproute2 \
        # Klipper
        libffi-dev \
        gcc \
        g++ \
        python3-dev \
        make \
        # AVR chip installation and building
        avrdude gcc-avr binutils-avr avr-libc \
        # ARM chip installation and building
        gcc-arm-none-eabi binutils-arm-none-eabi newlib-arm-none-eabi \
        stm32flash \
        # Moonraker
        libsodium-dev \
        patch \
        # Simulavr
        cmake swig \
        # Fluidd
        wget unzip

# Copy root filesystem
COPY rootfs /
