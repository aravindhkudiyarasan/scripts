#!/bin/bash

username=appuser
password=password

SERVERS=`cat hosts.txt | awk '{print $1}'`
for server in $SERVERS; do
sshpass -p $password ssh -o StrictHostKeyChecking=no -q $username@$server "hostname=\$(hostname -i);(echo \$hostname)|tr '\n' ' ';value=\$(ps -ef|(grep -i 'java')|(grep -v grep)|(grep -i jboss) | wc -l); if [ \"\$value\" -ge \"1\" ]; then /home/appuser/prudhvi/jboss/jboss-master/bin/standalone.sh --version | (grep -i  'WildFly') else echo 'JBoss service is not running'; fi;  " >>jboss_version.txt
done
exit 0
