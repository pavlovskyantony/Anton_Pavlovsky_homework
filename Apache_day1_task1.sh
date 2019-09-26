#!/bin/bash

#
yum install -y httpd

#2
Create html page

#3
systemctl enable httpd.service
systemctl start httpd.service
systemctl status httpd.service

firewall-cmd --add-service=http --permanent && sudo firewall-cmd --add-service=https --permanent
firewall-cmd --reload

#open the www page

systemctl stop httpd.service

#2.1 Install Apache2
yum -y install arp apr-devel apr-util apr-util-devel pcre pcre-devel expat-devel openssl-devel
yum groupinstall " Development Tools"  -y

wget http://ftp.byfly.by/pub/apache.org//httpd/httpd-2.4.41.tar.gz
wget https://github.com/apache/httpd/archive/2.4.28.tar.gz -O httpd-2.4.28.tar.gz
wget https://github.com/apache/apr-util/archive/1.6.0.tar.gz -O apr-util-1.6.0.tar.gz
tar xzf httpd-2.4.41.tar.gz
tar -xzf apr-1.6.2.tar.gz
mv apr-1.6.2 httpd-2.4.41/srclib/apr
mv apr-util-1.6.0 httpd-2.4.41/srclib/apr-util
./configure --enable-ssl --enable-so --with-mpm=event --with-included-apr --prefix=/usr/local/apache2
make 
make install

cat << EOF > /etc/systemd/system/httpd.service

[Unit]
Description=The Apache HTTP Server
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/apache2/bin/apachectl -k start
ExecReload=/usr/local/apache2/bin/apachectl -k graceful
ExecStop=/usr/local/apache2/bin/apachectl -k graceful-stop
PIDFile=/usr/local/apache2/logs/httpd.pid
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF

systemctl start httpd.service

# Check
# What is apache graceful restart? Graceful restart tells the web sever to finish any active connections before restarting.
