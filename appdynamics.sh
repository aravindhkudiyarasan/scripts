#!/bin/bash 
# 
# chkconfig: 2345 99 05 
# description: AppDynamics machine agent 
# 
# Init file for the AppDynamics machine agent. This is different from the 
# AppDynamics application agent which is loaded by the application at runtime. 
# It reports on system metrics to the AppDynamics controller defined 
# 
start () { 
                out=`ps -ef | grep machineagent.jar | grep -v grep | wc -l` 
                if [ "$out" -ne 0 ]; then 
                echo "will stop any running machine-agent instances first" 
                stop 
                fi
                echo "Starting AppDynamics Machine Agent" 
                nohup java -Xmx64M -Dappdynamics.controller.hostName="appdynamicstest" -jar -Dappdynamics.controller.port="8090" -Dappdynamics.agent.applicationName="Titan-SE48"  -Dappdynamics.agent.tierName="costsandincomes" -Dappdynamics.agent.nodeName="dtraflocorh934" /opt/appdynamics/machine-agent/machineagent.jar >> /opt/appdynamics/machine-agent/logs/machine-agent-start.log & 
                RETVAL=$? 
} 
stop () { 
                echo "Stopping AppDynamics Machine Agent" 
                for procid in `pgrep -f machineagent.jar` 
                do 
                        kill -9 $procid 
                        RETVAL=$? 
                done 
}

case "$1" in 
        start) 
                start 
        ;; 
        stop) 
                stop 
        ;; 
        *) 
                echo "Usage: /etc/init.d/ad-machine-agent {start|stop}" 
                RETVAL=1 
        ;; 
esac 
exit $RETVAL
