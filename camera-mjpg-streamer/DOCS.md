# Documentation

## Configuration

- `mjpg_input`: Specify input arguments for mjpg_streamer.

## How to use

Set input arguments through `mjpg_input` configuration option, start the add-on.

## Accessing camera from Home Assistant

The camera stream and snapshot can be accessed by e.g. [MJPEG IP Camera](https://www.home-assistant.io/integrations/mjpeg/), with URLs:
* MJPEG URL: `http://<addon-hostname>/?action=stream`
* Still image URL: `http://<addon-hostname>/?action=snapshot`.

Addon hostname can be found under [addon settings](https://my.home-assistant.io/redirect/supervisor_addon/?addon=b7aa59c4_camera-mjpg-streamer&repository_url=https%3A%2F%2Fgithub.com%2Ffredrikbaberg%2Fha-3dprinter-addons).

## Ingress?

Ingress support is included only to verify that the camera can be accessed. Streaming will most likely only work in the "JavaScript" tab.

## Testing

For testing you can set `mjpg_input` to:
> input_file.so -f /www_mjpg -e

This will result in showing a test image.

## Versions

Some notes regarding the software and versions.
Not all software is installed for all images.

- mjpg-streamer
  - Compiled from [https://github.com/jacksonliam/mjpg-streamer](https://github.com/jacksonliam/mjpg-streamer).
