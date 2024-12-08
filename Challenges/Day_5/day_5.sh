#!/bin/bash

echo "hillow day_5"

# /home/vinc/github repos/vinc/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Challenges/Day_5/mock_error_file.txt

read -p "enter log file path:  " filepath


num_ERROR=$(cat "$filepath" | grep -E "ERROR|FAILED" | wc -l)

#grep -o "ERROR" "$filepath" | wc -l

echo "num errors: $num_ERROR"

grep -o -n "ERROR" "$filepath" | awk -F: '{printf "%s \n", $1}'



