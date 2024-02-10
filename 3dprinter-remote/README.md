# 3DPrinter-Remote

Lets you connect a 3D printer to one device and connect to it from a different one running OctoPrint.
Add-on runs ser2net and can be connected to by e.g. socat.

*Note: Performance will be very dependent on network.*

## Usage

On the machine connected to the printer (`remote machine`):
* Setup the add-on. At minimum you will need to specify `printer_path` and verify that `baud_rate` is correct.

On the machine with OctoPrint (`host machine`):
* Go to Settings --> Serial Connection, section __Additional serial ports__. Add : `socket://<remote machine>:9999`. For example, use the IP for `remote machine`.
* Install plugin [OctoPrint-Network-Printing](https://github.com/hellerbarde/OctoPrint-Network-Printing)
