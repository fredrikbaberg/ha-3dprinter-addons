ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base"

FROM ${BUILD_FROM}

WORKDIR /root

RUN apk add --no-cache \
        git \
        py3-virtualenv \
        python3-dev \
        libffi-dev \
        build-base \
        curl-dev
    # && git clone https://github.com/KevinOConnor/klipper \
    # && git clone https://github.com/Arksine/moonraker.git

# RUN virtualenv klippy-env \    
#     && ./klippy-env/bin/pip install -r ./klipper/scripts/klippy-requirements.txt

# RUN virtualenv moonraker-env \
#     && ./moonraker-env/bin/pip install -r ./moonraker/scripts/moonraker-requirements.txt

COPY rootfs /
RUN chmod +x /etc/cont-init.d/*.sh
RUN chmod +x /etc/services.d/*/*
