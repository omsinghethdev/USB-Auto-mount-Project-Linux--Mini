#!/bin/bash
echo "Warning:This will erase all data on the USB device!"
attempt=0
max_attempt=3

while true; do
read -p "Enter device(eg., /dev/sdb) " DEV
if [ -z "$DEV" ]; then
    echo "No device entered. Try again..."
    continue
fi
if [ ! -b "$DEV" ]; then
	echo "[ERROR] Device does not exist or is not valid. Try agian...."
	attempt=$((attempt+1))

	if [ $attempt -ge $max_attempt ]; then
		echo "[ERROR] Too many invalid attempts. Exiting...."
		exit 1
	fi
	continue
fi
break
done
confirm_attempt=0
confirm_max=3

while true; do 
	read -p "Type the device name again to confirm: " CONFIRM_DEV
	
	if [ "$CONFIRM_DEV" = "$DEV" ]; then
		echo "[OK] Confirmation successful. Proceeding..."
		break
	else
		echo "[ERROR] Device name mismatch."
		confirm_attempt=$((confirm_attempt+1))
		
	if [ $confirm_attempt -ge $cofirm_max ]; then
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

while true; do
	read -p "Enter partion table type (gpt/msdos): " PTABLE
	
	if [ -z "$PTABLE" ]; then
		echo "[ERROR] No input. Try again."
		continue
	fi
	
	if [[ "$PTABLE" != "gpt" && "$PTABLE" != "msdos" ]]; then
		echo "[ERROR] Invalid type. Choose 'gpt' or 'msdos.'
		continue
	fi
	
	echo "[OK] Selected partion table: $PTABLE"
	break
done


while true;do
	read -p "Enter the number of partion: " PCOUNT
	
	if [ -z "$PCOUNT" ]; then
		echo "[ERROR] No input . Try again."
		continue
	fi
	if ! [[ "$PCOUNT" =~ ^[0-9]+$ ]]; then
		echo "[ERROR] Enter a valid number."
		continue		
	fi
	
	if [ "PCOUNT" -le 0 ]; then 
		echo "[ERROR] Must be greater than 0."
		continue
	fi

	echo "[OK] Number of partitions: $PCOUNT"
	break
done


