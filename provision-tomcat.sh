#!/bin/bash

echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > /etc/resolv.conf
apt-get update -y
apt-get upgrade -y
apt-get install -y nano git openjdk-7-jdk openjdk-7-jre-headless

cd /usr/local
wget http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-8/v8.5.33/bin/apache-tomcat-8.5.33.tar.gz
tar -xzvf apache-tomcat-8.5.33.tar.gz
ln -s apache-tomcat-8.5.33 tomcat

cp /vagrant/tomcat8 /etc/init.d/tomcat8
chmod 755 /etc/init.d/tomcat8
update-rc.d tomcat8 defaults
service tomcat8 start
