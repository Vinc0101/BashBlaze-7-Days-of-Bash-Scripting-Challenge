#!/bin/bash



function dsiplay_usage {

    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')  #prints how much percentage of _the cpu is used by user processes
                                                                #needs to be stored as value using $
    echo "cpu usage: $cpu_usage%"

    ram_usage=$(free -h |grep 'Mem' | awk '{print $3}')
    echo "nenory usage: $ram_usage"

    space_used=$(df -h / |tail -1| awk '{print $3}') #df -h / gets disk usage on root, tail -l get last line

    echo "disk usage: $space_used"


}

function monitor_process() {

    read -p "enter process name: " local_process_name


    if pgrep -x "$local_process_name" >/dev/null; then
        echo "$local_process_name is running"
    else
        echo "$local_process_name is not running"
    fi

}



echo "echoooo"


while true; do

    echo "---- Monitoring Metrics Script ----"
    echo "1. View System Metrics"
    echo "2. Monitor a Specific Service"

    read -p "Enter your choice (1, 2, or 3): " choice

        case $choice in
        1)
            dsiplay_usage
            ;;
        2)
            monitor_process
            ;;
        3)
            echo "Exiting the script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Error: Invalid option. Please choose a valid option (1, 2, or 3)."
            ;;
    esac

    # Sleep for 5 seconds before displaying the menu again
    sleep 2
done




dsiplay_usage


