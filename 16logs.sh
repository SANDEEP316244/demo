#!/bin/bash
user_id=$(id -u)

logs_folder="/var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1 )
log_file="$logs_folder/$script_name.log"
mkdir -p $logs_folder
echo " script started executing $(date) " | tee -a $log_file

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $? -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N" | tee -a $log_file
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $log_file
    fi
}


if [ $user_id -ne 0 ]; then
echo " RUN AS A SUDOER "
fi

dnf list installed mysql &>>$log_file

if [ $? -ne 0 ]; then
dnf install mysql &>>$log_file
VALIDATE "MySQL"
else
echo " mysql already installed "
fi
