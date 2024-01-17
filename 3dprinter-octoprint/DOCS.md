# Startup

Set a network port in addon settings to be able to access the WebUI.

# Addon configuration

## Trusted proxies

*If you have placed a reverse proxy in front of Home Assistant*, by setting trusted proxies you should be able to use HTTPS. For more information, see [Caddy documentation](https://caddyserver.com/docs/caddyfile/directives/reverse_proxy).

# OctoPrint integration

You can use the OctoPrint integration with this addon. Go to Home Assistant, add integration OctoPrint, and use the following:
- Host: `cce6f2d5-3dprinter-octoprint` (use the add-on hostname, the first part could differ).
- port: 5000
- Don't use SSL (leave unchecked)

Go to OctoPrint WebUI, you should see a request for authentication.

# Camera

This addon does not include a camera server, it has to be setup separately. 

You could, for instance, use the addon [camera-mjpg-streamer](https://github.com/fredrikbaberg/ha-3dprinter-addons/tree/main/camera-mjpg-streamer) available in the same repository. Note that this method **only allows for snapshot**, it does **NOT** work for camera stream as this requires the browser/app used to directly access the stream.

# Remote access

If you need remote access, have a look at [remote access plugins for OctoPrint](https://plugins.octoprint.org/topics/remote_access/). Remember to **NEVER** directly portforward your OctoPrint instance to the internet!
