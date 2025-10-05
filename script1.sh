#!/bin/bash
#
#By: Ivan Davydenko
#
#Date 2025 Oct 05
#
#Porpuse:Show system information


hostName=$(hostname)
date=$(date)
userName=$(whoami)
source /etc/os-release
osName=$PRETTY_NAME





echo $osName
echo $hostName

