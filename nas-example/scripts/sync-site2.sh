#!/bin/sh
. /scripts/common.sh
sync_repo "http://192.168.1.10:3000/myuser/site2.git" "main" "/app/site2"
