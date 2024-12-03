#!/bin/bash

#task1
#this shell script does basic ommands

#task2

echo "task 2"

#task3

username="vinc"

echo $username

#task4

val1=4
val2=2
sum=$((val1+val2))

echo $val1 "+" $val2 "=" $sum

#task5
date

echo "today is the $(date) "
echo "the time is $(date '+%H:%M:%S')"
echo "i am $USER"
echo "i am using $SHELL"

#task 6

<<comment
Wildcards are special characters in shell scripting and the command line that represent one or more characters. They are especially useful for file matching or manipulation tasks
comment

ls *.sh