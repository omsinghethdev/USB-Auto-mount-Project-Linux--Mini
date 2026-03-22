#!/bin/bash
echo "Warning:This will erase all data on the USB device!"
read -p "Enter device: " DEV
if [ -z "$DEV" ]; then
    echo "No device entered. Exiting."
    exit 1
fi
read -p "Are you sure? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
echo "Aborted."
exit 1
fi
echo "Unmounting existing partitions...."
sudo umount ${DEV}?* 2>/dev/null

echo "Creatin partition table...."
sudo parted -s  $DEV mklabel gpt


echo "Creating partions..."
sudo parted -s -a optimal $DEV mkpart primary ext4 1MiB 50%
sudo parted -s -a optimal $DEV mkpart primary  50% 100%

echo "Formatting partitions..."
sudo mkfs.ext4 ${DEV}1
sudo mkfs.exfat ${DEV}2
echo "Done! USB prepared successfully."

