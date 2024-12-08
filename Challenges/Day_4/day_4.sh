#!/bin/bash

echo "hillow hillow"

#read -p "enter process name:  " process_name


function is_process_running() { 
    local_process_name=$1

    if pgrep -x "$local_process_name" >/dev/null; then
        return 0
    else
        return 1 #return 1 if process is running
    fi
}

function restart_process() {

    local_process_name=$1

    if sudo systemctl restart "$local_process_name"; then
        echo "restarted $local_process_name"
    else
        echo "could not find or restart $local_process_name"
    fi

}



process_name=$1

echo "you entered $process_name"

if is_process_running "$process_name"; then

    echo "$process_name is running"

else
    restart_process "$process_name"
fi


<<old
if ps aux | grep -w $process_name | grep -v grep > /dev/null; then
    echo "Process exists! "
    sudo systemctl status "$process_name" | awk '/Active:/ {print $2, $3}'

    curr_state=sudo systemctl status "$process_name" | awk '/Active:/ {print $3}'
    echo "$curr_state"



else
    echo "Process does not exits."
>>