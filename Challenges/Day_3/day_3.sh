#!/bin/bash

echo "hello day 3"

read -p "enter username:  " username

if id "$username" &>/dev/null; then
    echo "User already exists"
else
    read -p "enter password:  " password
    sudo useradd -s /bin/bash "$username"
    echo "$username:$password" | sudo chpasswd #chpasswd tkaes username and pass


fi

function create_user {

    
}