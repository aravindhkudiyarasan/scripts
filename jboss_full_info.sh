#!/bin/bash

#This script is used to provide details about running jboss server"

echo "=============================================="
echo "**********************************************"
echo "=============================================="


hostname=$(hostname --all-ip-addresses | cut -b 1-13)
echo "hostname : " $hostname
date=$(date +"%d-%m-%Y-%H-%M")
echo "date : "$date
value=$(ps -ef|grep -i java |grep -v grep |wc -l)
#echo $value
if [ "$value" -ge "1" ]; then
#echo "java process are running in" $hostname
JBOSSHOME='/home/jboss-eap'
#$echo $JBOSSHOME;
versionoutput=$($JBOSSHOME/bin/jboss-cli.sh --connect --version | grep Product | cut -b 10-27)
#versionoutput=$(cat version.txt)
echo "Jboss version details"
echo "#####################"
echo $versionoutput
echo " "
else

echo "java process are not running in :" $hostname
fi
