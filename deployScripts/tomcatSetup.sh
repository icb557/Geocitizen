#!/bin/bash

#tomcat user
sudo useradd -m -U -d /usr/share/tomcat9/ -s /bin/bash -p $(openssl passwd -1 tomcat) tomcat

#permissions and ownership
sudo chown -R tomcat: /usr/share/tomcat9/
sudo sh -c 'chmod +x /usr/share/tomcat9/bin/*.sh'
sudo sh -c 'chmod -R o=rwx /usr/share/tomcat9/webapps/'

#service config
cp auxFiles/tomcatServiceConf.txt /etc/systemd/system/tomcat.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat
sudo systemctl status tomcat

