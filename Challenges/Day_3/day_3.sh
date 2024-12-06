#!/bin/bash

echo "hello day 3"



function create_user {

    read -p "enter username:  " username

    if id "$username" &>/dev/null; then
        echo "User already exists"
    else
        read -p "enter password:  " password
        sudo useradd -s /bin/bash "$username"
        echo "$username:$password" | sudo chpasswd #chpasswd tkaes username and pass   fi

    fi
}


function delete_user {

    read -p "enter username:  " username

    if ! id "$username" &>/dev/null; then
        echo "User does not exist"
    else
        sudo deluser "$username"
        echo "user deleted"

    fi
}

if  [ $# -gt 0 ]; then #checks if number of arguments is greater than 0

    if [ "$1" = "-c" ] || [ "$1" = "--create" ]; then

        create_user

    elif [ "$1" = "-d" ] || [ "$1" = "--delete" ]; then

        delete_user

    else
        echo "invalid argument"


    fi

else
    echo "please set an argument"
fi