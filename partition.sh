while true; do
	read -p "Enter partion table type (gpt/msdos): " PTABLE
	
	if [ -z "$PTABLE" ]; then
		echo "[ERROR] No input. Try again."
		continue
	fi
	
	if [[ "$PTABLE" != "gpt" && "$PTABLE" != "msdos" ]]; then
		echo "[ERROR] Invalid type. Choose 'gpt' or 'msdos.'"
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
	
	if [ "$PCOUNT" -le 0 ]; then 
		echo "[ERROR] Must be greater than 0."
		continue
	fi

	echo "[OK] Number of partitions: $PCOUNT"
	break
done

