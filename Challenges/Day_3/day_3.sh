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


function reset_password {

    read -p "enter username:  " username

    if ! id "$username" &>/dev/null; then
        echo "User does not exist"
    else
        read -p "enter new pssword: " password
        read -p "reype new password: " password_retyped

        if [ "$password" = "$password_retyped" ]; then #spacing syntax is crucial
            echo "$username:$password" | sudo chpasswd #chpasswd tkaes username and pass 
            echo "password  successfull<< changed"

        else
            echo "passwords dont match"
        fi

    fi
}


function delete_user {

    read -p "eneter user that you want to reset:  " username

    if ! id "$username" &>/dev/null; then
        echo "User does not exist"
    else
        sudo deluser "$username"
        echo "user deleted"

    fi
}


function list_users {
    cat /etc/passwd | awk -F: '{ print "Username: " $1 " (UID: " $3 ")" }'
}


function display_usage { 
    echo "Usage: $0 [OPTIONS]" #$0 ) function name
    echo "Options:"
    echo "  -c, --create     Create a new user account."
    echo "  -d, --delete     Delete an existing user account."
    echo "  -r, --reset      Reset password for an existing user account."
    echo "  -l, --list       List all user accounts on the system."
    echo "  -h, --help       Display this help and exit."
}

if  [ $# -gt 0 ]; then #checks if number of arguments is greater than 0

    if [ "$1" = "-c" ] || [ "$1" = "--create" ]; then

        create_user

    elif [ "$1" = "-d" ] || [ "$1" = "--delete" ]; then

        delete_user

    elif [ "$1" = "-r" ] || [ "$1" = "--reset" ]; then
        reset_password

    elif [ "$1" = "-l" ] || [ "$1" = "--list" ]; then
        list_users

     elif [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        display_usage

    else
        echo "invalid argument"


    fi

else
    display_usage
fi