#!/bin/bash

#https://github.com/piwikla/da

#Update
yum update

#pre-install
yum install wget gcc gcc-c++ flex bison make bind bind-libs bind-utils openssl openssl-devel perl quota libaio libcom_err-devel libcurl-devel gd zlib-devel zip unzip libcap-devel cronie bzip2 db4-devel cyrus-sasl-devel perl-ExtUtils-Embed autoconf automake libtool which patch psmisc net-tools

#screen mode
yum install screen
screen -S da

#setup
wget http://www.directadmin.com/setup.sh
chmod 755 setup.sh
./setup.sh

cd /usr/local/directadmin/custombuild
./build update
./build secure_php

cd /usr/local/directadmin/custombuild
./build update
./build all d

cp -f /usr/share/mysql/my-huge.cnf /etc/my.cnf
