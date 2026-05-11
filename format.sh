
if [ -z "$PARTITION"]; then
    echo "[ERROR]No partion found."
    exit 1
fi

while true; do

    echo
    echo "Choose filesystem type"
    echo "1. ext4"
    echo "2. FAT32"
    echo "3. NTFS"
    read -p "Enter your choise(1-3):" FS_CHOICE
        if [ -z "$FS_CHOICE"]; then
            echo "[ERROR]NO input.Try again"
            continue
        fi
    case "$FS_CHOICE" in

        1)
            FILESYSTEM="ext4"
            break
            ;;
        2) 
            FILESYSTEM="vfat"
            break
            ;;
        3) 
            FILESYSTEM="ntfs"
            break
            ;;
        *) 
            echo "[ERROR]Invalid choice"
            ;;
    esac
done
    echo "Selected filesystem is ${FILESYSTEM}"




    echo "[INFO] Formatting partition..."

        case "$FILESYSTEM" in
            ext4)
                  mkfs.ext4 -F "$PARTITION"
                  ;;
            vfat)
                  mkfs.vfat  "$PARTITION"
                  ;;
            ntfs)
                  mkfs.ntfs  -F "$PARTITION"
        esac

        if [$? -ne 0]; then
            echo "[ERROR]Formatting failed"
            exit 1
        fi
        echo "Formatting completed successfully."

        echo 
        echo "[INFO]Filesystem Details:"

        lsblk -f "$PARTITION"