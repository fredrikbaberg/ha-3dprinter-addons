# Startup

Set a network port in addon settings, to be able to access the WebUI.

# Addon configuration

## Trusted proxies

By setting trusted proxies you should be able to use HTTPS *if you have placed a reverse proxy in front of Home Assistant*. For more information, see [Caddy documentation](https://caddyserver.com/docs/caddyfile/directives/reverse_proxy).

# OctoPrint integration

You can use the OctoPrint integration with this addon. Go to Home Assistant, add integration OctoPrint, and use the following:
- Host: `b7aa59c4-3dprinter-octoprint`
- port: 5000
- Don't use SSL (leave unchecked)

Go to OctoPrint WebUI, you should see a request for authentication.

# Camera

There is no camera server in the addon, it has to be setup separately.

You could, for instance, use the addon [camera-mjpg-streamer](https://github.com/fredrikbaberg/3dprinter-addons/tree/main/camera-mjpg-streamer) available in the same repository. If so, you can set the snapshot URL to:
> `http://b7aa59c4-camera-mjpg-streamer/?action=snapshot`.

Note that this method **only allows for snapshot**, it does **NOT** work for camera stream as this requires the browser/app used to directly access the stream.

# Ingress?

This addon drops support for Ingress. The main reason for this is issues with finding a working configuration.

* An update to OctoPrint increased the security (which is good!). Unfortunately it also broke the configuration used in this addon, most likely due to this addon not behaving properly.
* There has been issues with accessing camera stream by Ingress since I added support for it, which I have not been able to solve.

I have tried to find a solution to this, without success. Therefore I decided to disable the option, as it just leads to frustration.

If someone is able to find a working configuration, please let me know.

If you need remote access, have a look at [remote access plugins for OctoPrint](https://plugins.octoprint.org/topics/remote_access/). Remember to **NEVER** directly portforward your OctoPrint instance to the internet!