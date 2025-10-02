#!/bin/bash
user_id=$(id -u)




if [ $user_id -ne o ]; then
echo " RUN AS A SUDOER "
fi 

dnf list installed mysql 

if [ $? -ne 0 ]; then
dnf install mysql
else
echo " mysql already installed "
fi
