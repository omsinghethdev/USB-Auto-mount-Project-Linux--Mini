
if [ -z "$PARTITION" ]; then
    echo "[ERROR]No partition found."
    exit 1
fi

echo "[INFO]:Selected partition: $PARTITION"

    while true; do

        read -p "Enter mount path( /mnt/myusb ) :" MOUNT_PATH
            if [ -z "$MOUNT_PATH" ]; then
                echo "[ERROR]No input. Try again."
                continue
            fi
        break
    done
            if [ ! -d "$MOUNT_PATH" ]; then
                echo "[INFO]Creating mount directory...."
                sudo mkdir -p "$MOUNT_PATH"
                if [ $? -ne 0 ]; then
                    echo "[ERROR]Failed to create mount directory."
                    exit 1
                fi
            fi
    echo "[INFO] Mounting Partition..."
    sudo mount "$PARTITION" "$MOUNT_PATH"
            if [ $? -ne 0 ]; then
                echo "[ERROR]Failed to mount partion."
                exit 1
            fi
    echo "[OK] Partition mounted successful."

    echo
    echo "[INFO] Mounted Filesystem: "
    df -h | grep "$PARTITION"


