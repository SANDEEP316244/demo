#!/bin/bash
user_id=$(id -u)

logs_folder="/var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1 )
log_file="$log_folder/$script_name.log"
mkdir $logs_folder
echo " script started executing $(date) " | tee -a $log_file


if [ $user_id -ne 0 ]; then
echo " RUN AS A SUDOER "
fi 

dnf list installed mysql 

if [ $? -ne 0 ]; then
dnf install mysql
else
echo " mysql already installed "
fi
