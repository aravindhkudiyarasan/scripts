#!/bin/bash
#THIS SCRIPT IS USED TO TAKE SERVER LIST FROM SERVER.TXT FILE AND WILL DO SSH TO THAT HOST TO RUN THE JBOSS_FULL_INFO.SH SCRIPT
username=$(whoami)
echo -n Password for $username:
read -s password
echo " "

#username=root
#password=$1

SERVERS=`cat servers.txt | awk '{print $1}'`
for server in $SERVERS; do

touch log.txt > /dev/null
echo > log.txt
sshpass -p$password ssh -o StrictHostKeyChecking=no $username@$SERVERS sh /home/jboss-eap/jboss_full_info.sh >> log.txt
done
exit 0
