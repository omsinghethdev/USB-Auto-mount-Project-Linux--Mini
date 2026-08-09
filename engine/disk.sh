#Description:List physical disk devices, excluding loop and rom devices
#Argument:NONE
#Returns: Populates disks_name array with disk name,size,type
disk_list() {
    mapfile -t disk_names < <(lsblk -d -n -o NAME,SIZE,TYPE| grep -w disk)
}

#Description:List a disk's partitions size, filesystem type and mount status 
#Argument:
#   $1 = disk name (e.g sda)
#Returns: Populates disk_details array with disk/partition info 
disk_info(){
    local disk_name="$1"
    mapfile -t disk_details < <(lsblk -n -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT /dev/$disk_name)
}

#Description:Checks the block device exists or not 
#Argumnets:
#   $1 = disk name e.g(sda, sdb)
#Returns: 0 if disk  exists , 1 otherwise 

disk_exists(){
    local disk_name="$1"
    if [ -b "/dev/$disk_name" ]; then
        return 0
    else
        return 1
    fi
}

# Description: Gives the type of disk -SSD or -HDD
# Arguments:
#  $1 = disk name
# Returns: Prints "SSD" or "HDD" based on the disk's rotational  flag
# Note: USB devices can be unreliable here - some report HDD (1)
#       even without moving parts, depending on driver behavior

disk_type() {
    local disk_name="$1"
    local rotational=$(cat /sys/block/$disk_name/queue/rotational)

    if [ "${rotational}" -eq 0 ]; then
        echo "SSD"
    else
        echo "HDD"
    fi
}
disk_type sdb
