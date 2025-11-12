#!/bin/bash
#
#Name: Ivan Davydenko
#
#Porpuse: Modify the configuration of the Server
#
#Date: 2025 Nov 11

if  "$USER" != "root" ; then
    echo "Please run this script as syupper user (sudo)"
    exit 1
fi

if ! grep -q "192.168.16.21 server1" /etc/hosts; then
    echo "updating ip addres on server 1 in /etc/hosts"
    sed -i '/server1$/ s/192\.168\.16\.[0-9]\+/192.168.16.21/' /etc/hosts
else
    echo "server1 already has the corect ip"
fi

if dpkg -s apache2 >/dev/null 2>&1; then
    echo "Apachie is alredy instaled checking for default configuration"
    if ! grep -q "/var/www/html" /etc/apache2/sites-available/000-default.conf; then
        echo "Apachie is not in its default configuration reinstaling"
        apt purge -y apache2
        apt install -y apache2
        systemctl start apache2
    else
        echo "Apachie is alredy in its default configuration"
    fi
else
    echo "Apachie is not instaled, instaling now"
    apt install -y apache2
    systemctl start apache2
fi

if dpkg -s squid >/dev/null 2>&1; then
    echo "Squid web proxy is alredy instaled checking for default configuration"
    if ! grep -q "http_port 3128" /etc/squid/squid.conf; then
        echo "Squid web proxy is not in its default configuration changing"
        apt purge -y squid
        apt install -y squid
        systemctl start squid
    else
        echo "Squid web proxy is alredy in its default configuration"
    fi
else
    echo "Squid web proxy is not instaled, instaling now"
    apt install -y squid
    systemctl start squid
fi
