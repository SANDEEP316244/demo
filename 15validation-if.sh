#!/bin/bash

user_id=$(id -u);

if [ $user_id -ne 0 ]; then
echo "RUN AS A ROOT USER "
exit 1
fi

vallidate(){
if [ $? -eq 0 ];then
echo " sucessfully installed $1"
else
echo " $1 failed to install "
fi


1yum list installed mysql
if [ $? -ne 0 ]; then
yum install mysql -y

else
 echo -e "MySQL already exist"
fi
