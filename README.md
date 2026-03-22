USB Auto-Mount Project(Linux)

Overview:This project demonstrates how to automatically mount a USB pendrive in Linux using UUID and /etc/fstab
Instead of mounting manually every time,the USB now mounts automatically to a fixed directory.


Problem:
 When plugging in a USB device:
 It mounts to random locations
 Device name changes
 Manual mounting is required each time

Solution:
 Used UUID for stable identification
 Configured /etc/fstab for auto-mount
 Created custom mount points

Setup Script
./setup-usb.sh
