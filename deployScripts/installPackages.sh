#!/bin/bash

sudo apt update

#frontend packages
sudo apt install python2 nodejs npm -y

#backend packages
sudo apt install openjdk-8-jdk maven -y

#DB packages
sudo apt install postgresql postgresql-contrib mongodb -y

#tomcat installation
cd /tmp
curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.104/bin/apache-tomcat-9.0.104.tar.gz
sudo mkdir /usr/share/tomcat9
sudo tar xzvf apache-tomcat-9.0.104.tar.gz -C /usr/share/tomcat9 --strip-components=1
