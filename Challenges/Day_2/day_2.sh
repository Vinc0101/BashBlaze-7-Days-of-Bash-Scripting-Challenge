#!/bin/bash


echo "welcome to task 2"

while true; do
    ls -lh

    read -p "enter a line of text:  " input

    if [ -z "$input" ]; then #-z checks if the lenght of a string is zero, therefore input needs to be used as a string
                                #conditions need spaces stound brackets!
        echo "empty input, exiting scripts"
        break
    fi

    echo -n "$input" | wc -m #this runs wc -c on the inout

    char_count=$(echo -n "$input" | wc -m)
    echo "Character Count: $char_count"
done
