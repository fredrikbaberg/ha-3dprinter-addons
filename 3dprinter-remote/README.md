# 3DPrinter-Remote

Provides remote access to 3DPrinter. Add-on runs ser2net and can be connected to by e.g. socat.

## Usage

On the machine connected to the printer (`remote machine`):
* Setup the add-on. At minimum you will need to specify `printer_path` and verify that `baud_rate` is correct.

On the machine with OctoPrint:
* Go to Settings --> Serial Connection, section __Additional serial ports__. Add : `socket://<remote machine>:9999`. For example, use the IP for `remote machine`.
* Install plugin [OctoPrint-Network-Printing](https://github.com/hellerbarde/OctoPrint-Network-Printing)