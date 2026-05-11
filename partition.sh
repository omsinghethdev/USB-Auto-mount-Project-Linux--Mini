while true; do
	read -p "Enter partition table type (gpt/msdos): " PTABLE
	
	if [ -z "$PTABLE" ]; then
		echo "[ERROR] No input. Try again."
		continue
	fi
	
	if [[ "$PTABLE" != "gpt" && "$PTABLE" != "msdos" ]]; then
		echo "[ERROR] Invalid type. Choose 'gpt' or 'msdos.'"
		continue
	fi
	
	echo "[OK] Selected partition table: $PTABLE"
	break
done


while true;do
	read -p "Enter the number of partition: " PCOUNT
	
	if [ -z "$PCOUNT" ]; then
		echo "[ERROR] No input . Try again."
		continue
	fi
	if ! [[ "$PCOUNT" =~ ^[0-9]+$ ]]; then
		echo "[ERROR] Enter a valid number."
		continue		
	fi
	
	if [ "$PCOUNT" -le 0 ]; then 
		echo "[ERROR] Must be greater than 0."
		continue
	fi

	echo "[OK] Number of partitions: $PCOUNT"
	break
done
	if [ "$PCOUNT" -ne 1 ]; then
		echo "[ERROR] Currently 1 partion is supported."
		exti 1
	fi
echo
echo "This will erase all the data on  ${CONFIRM_DEV} "

read -p "Do you want to continue? (yes/no)" CONFIRM

		if [ "$CONFIRM" != 'yes' ]; then
			echo "[INFO] Operation Cancelled."
			exit 1
		fi

	echo
	echo "[INFO]Creating partition table..."
	parted -s "$CONFIRM_DEV" mklabel "$PTABLE"

		if [ $? -ne 0 ]; then
			echo "[INFO] Failed to create partition table."
			exit 1
		fi
	echo "[OK] Partition table created successfully."
	echo
	echo "[INFO]Creating partition..."
	parted -s "$CONFIRM_DEV" mkpart primary ext4 0% 100%
		if[ $? -ne 0 ]; then
			echo "Partition creation failed."
			exit 1
		fi
	echo "[OK]Partition created successfully."
	echo
	echo "[INFO]Reloading partition table."	

	partprob "$CONFIRM_DEV"
	PARTITION="${CONFIRM_DEV}1"
	export PARTITION

	echo "[OK]Created partition: $PARTITION"
	echo
	echo "[INFO]Current partition layout"
	lsblk "$CONFIRM_DEV"


	echo "[INFO]Seclected partion: ${PARTITION}"
	
