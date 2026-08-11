#Description: Appends a timestamped log entry (level, module, message) to log/diskpilot.log 
#Arguments:
#   $1 = info/error/warn
#   $2 = module name
#   $3 = message
#Returns: Appends a timestamped log entry to logs/diskpilot.log
log() {
    time_stamp=$(date "+%Y-%m-%d %H:%M:%S")
    local SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
    echo "${time_stamp} [$1] [$2] $3" >>  ${SCRIPT_DIR}/../logs/diskpilot.log

}



