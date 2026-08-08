log() {
    time_stamp=$(date "+%Y-%m-%d %H:%M:%S")
    SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
    echo "${time_stamp} [$1] [$2] $3" >>  ${SCRIPT_DIR}/../logs/diskpilot.log

}



