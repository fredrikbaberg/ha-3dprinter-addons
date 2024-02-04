ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base"
FROM ${BUILD_FROM}

# Setup path for persistent install of Python packages
ENV KLIPPER_PATH=/data/klipper
ENV KLIPPER_VENV_PATH=/data/python/klipper
ENV MOONRAKER_PATH=/data/moonraker
ENV MOONRAKER_VENV_PATH=/data/python/moonraker
ENV ADDON_CONFIG_PATH=/config
ENV SIMULAVR_PATH=/data/simulavr

# Preparations for Klipper
RUN apk add -U \
        caddy \
        git \
        py3-virtualenv \
        python3-dev \
        gcc \
        g++ \
        libffi-dev \
        make \
        dbus \
        # For building for different platforms
        # AVR chip installation and building
        avrdude gcc-avr binutils-avr avr-libc \
        # ARM chip installation and building
        stm32flash newlib-arm-none-eabi \
        gcc-arm-none-eabi binutils-arm-none-eabi libusb pkgconf \
        # Simulavr
        cmake swig \
        # For Moonraker
        patch \
        libsodium-dev \
        iproute2 \
        screen

# Copy root filesystem
COPY rootfs /
