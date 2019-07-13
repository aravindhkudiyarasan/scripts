#!/bin/bash
username=$(whoami)
echo -n Password for $username:
read -s password
echo " "
SERVERS=`cat servers.txt | awk '{print $1}'`
SCRIPT="ps -ef | grep -i java"
for HOSTNAME in ${SERVERS} ; do
touch log.txt > /dev/null
echo > log.txt
#ssh -o StrictHostKeyChecking=no -l ${username} -p$password ${HOSTNAME} "${SCRIPT}"
sshpass -p$password ssh -o StrictHostKeyChecking=no $username@$SERVERS "${SCRIPT}"
done
exit 0
