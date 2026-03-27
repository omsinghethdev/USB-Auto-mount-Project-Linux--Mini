#!/bin/bash
echo "Warning:This will erase all data on the USB device!"
while true; do
read -p "Enter device(eg., /dev/sdb) " DEV
if [ -z "$DEV" ]; then
    echo "No device entered. Try again..."
    continue
fi
if [ ! -b "$DEV" ]; then
	echo "[ERROR] Device does not exist or is not valid. Try agian...."
	continue
fi
break
done
attempt=0
max_attempt=3

while true; do 
	read -p "Type the device name again to confirm: " CONFIRM_DEV
	
	if [ "$CONFIRM_DEV" = "$DEV" ]; then
		echo "[OK] Confirmation successful. Proceeding..."
		break
	else
		echo "[ERROR] Device name mismatch."
		attempt=$((attempt+1))
		
	if [ $attempt -ge $max_attempt ]; then
		echo "[ERROR] Too many failed attempts. Exiting..."
		exit 1
	fi
		
	read -p "Do you want to retry? (yes/no): " choice
	if [ "$choice" != "yes" ]; then
		echo "Exiting...."
		exit 1
	fi
	fi
done



