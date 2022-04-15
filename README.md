# usb-notify
This application will alert you while running of usb's that have been inserted
into the linux machine.

Behind the scenes it uses the linux device manager udev
to scan the system for new devices of the subsystem usb, and then looks at the
action to see if it's a device being inserted into the machine.

It then uses the libnotify framework to display a message to the current user.

## Building
You will need libudev and libnotify for this application to build.

## Usage
### SystemD
Since it depends on user session to send notification, setup the service as a user:
```bash
systemctl --user link /absolute/path/to/usb-notify/systemd/usbnotify.service
systemctl --user daemon-reload
systemctl --user enable usbnotify.service
systemctl --user start usbnotify.service
```

### Other startup
`$ usb-notify &` in your startup script (~/.xinitrc)
