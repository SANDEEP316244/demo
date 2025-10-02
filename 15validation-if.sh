#!/bin/bash

user_id=$(id -u);

if [ $user_id -ne 0 ]; then
echo "RUN AS A ROOT USER "
exit 1
fi

validate(){
if [ $? -eq 0 ];then
echo " sucessfully installed $1"
else
echo " $1 failed to install "
fi
}

yum list installed mysql
if [ $? -ne 0 ]; then
yum install mysql -y
validate "mysql"
else
 echo -e "MySQL already exist"
fi

yum list installed nginx
if [ $? -ne 0 ]; then
yum install nginx -y
validate "nginx"
else
echo " nginx already exists "
fi
