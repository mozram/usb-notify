#!/bin/bash

mkdir -p /opt/usbnotify
install -m 755 ./build/usb-notify /usr/local/bin/usb-notify
install -m 755 ./asset/usb-insert.wav /opt/usbnotify/usb-insert.wav
