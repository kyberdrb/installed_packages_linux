#!/bin/sh

set -x

SCRIPT_DIR="$(dirname "$(readlink --canonicalize "$0")")"

# detach printer gracefully to prevent duplicate attachment of the same device to another port which makes the device unresponsive

"${SCRIPT_DIR}/detach_printer.sh"

# attach printer gracefully
usbip list --remote=192.168.31.204
usbip port
echo ""
usbip attach --remote=192.168.31.204 --busid=1-1.3

sleep 1
usbip list --remote=192.168.31.204
usbip port

# attach printer violently
# TODO when the attaching of the printer fails, try to force-attach it
#echo The password is ...? :)
#ssh rpi@192.168.31.204 'systemctl reload usbip-printer.service'
#usbip list --remote=192.168.31.204
#usbip attach --remote=192.168.31.204 --busid=1-1.3

# TODO when even the force-attaching failed, print to terminal 
#  that the device is physically disconnected from the USB/IP server 
#  or connected to different port

