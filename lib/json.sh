json_success() {
    echo "{\"status\":\"ok\",\"data\":$1}"
}

json_error() {
    echo "{\"status\":\"error\",\"code\":\"$1\",\"message\":\"$2\"}"
}


