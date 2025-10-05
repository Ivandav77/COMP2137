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
runTime=$(uptime)
cpuInfo=$(lscpu | grep "Model name" | cut -d: -f2 | xargs)
ramInfo=$(free -h | awk '/Mem:/ {print $2}')


echo $ramInfo
echo $osName
echo $hostName
echo $runTime
echo $cpuInfo
