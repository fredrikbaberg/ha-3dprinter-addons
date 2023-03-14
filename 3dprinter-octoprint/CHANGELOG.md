## 2023.03.0
  * Mark 3DPrinter-OctoPrint stable
  * Set realtime flag

## 2023.02.0
  * Add binaries for flashing firmware to printer (avrdude, dfu-util, dfu-programmer, stm32flash).

## 2023.01.2
  * Disable AppArmor profile.

## 2023.01.1
  * Add AppArmor profile
  * Add support for GPIO

## 2023.01.0
  * Update to OctoPrint 1.8.6.
  * Disabled Ingress.
  * Based on Debian instead of Alpine, should make more plugins compatible.
  * Default config now set by CLI instead of copying pre-set file.
  * Using Caddy as reverse proxy.
  * Added option to set trusted_proxies, should help with reverse proxy configuration.
