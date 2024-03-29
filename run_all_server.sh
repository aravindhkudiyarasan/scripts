#!/bin/bash
#==============================================================================
# Date:     11/22/2016                  Author: McKesson / srh
#
# Quick and dirty shell script to run one command on multiple servers.  
#
# N.B. - It presumes that the current user exists on the remote server and
#        has SSH key access to the remote server.
#
# 05/26/2021 srh - Modified to accommodate AWS root login restrictions
#==============================================================================
function usage {
    echo "Usage: $0 TARGETS [ COMMAND ] -r"
    echo "  Where TARGETS is a file containing a list of servers on which COMMAND is to be run, 1 server / line."
    echo "  COMMAND, if specified, will override any command defined internally in the script."
    echo "  USER, if specified, will be the user as whom the command is run.  (Default is current user)."
}

TARGETS=$1
CMD=$2
ROOTFLAG=$3
DEBUG=0

KEYFILE=/root/.ssh/CDP-ProdEnvt-keypair-r100

# 01/31/2021 - No other user can do keyed access at the moment
ME='ec2-user';

if [ $ROOTFLAG == '-r' ]; then
        WARNROOT=" WITH SUDO PRIVILEGES";
else
        ME='ec2-user';
        # Unused, but prevents shell barfing downstream
  ROOTFLAG='NOTROOT'
fi

if [ -z $TARGETS ] || [ ! -e $TARGETS ]; then
    usage;
    exit 1;
else
    NUMSERVERS=`cat $TARGETS | wc -l`;
    echo "Target file '$TARGETS' exists and contains $NUMSERVERS servers."
fi


if [ -z ${CMD+x} ]; then
    # If you'd like to save a list of commands for future use, this is the spot
    CMD="ls";
else
    CMD=$2;
fi

read -p "Run command '$CMD' on the $NUMSERVERS servers in file '$TARGETS'$WARNROOT? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ]; then
    echo "Aborting."
    exit 1;
fi 

for CUR in `cat $TARGETS`
do
        echo "Results of '$CMD' from $CUR"
    echo " ";

    # The '-q' option suppresses the banner

                if [ $ROOTFLAG == '-r' ]; then

                        if [ $DEBUG -gt 0 ]; then
                echo "ssh -i $KEYFILE -q $ME@$CUR sudo $CMD"
                        else
                ssh -i $KEYFILE -q $ME@$CUR sudo $CMD
                        fi;

                else
                        if [ $DEBUG -gt 0 ]; then
                echo "ssh -i $KEYFILE -q $ME@$CUR $CMD"
                        else
                ssh -i $KEYFILE -q $ME@$CUR $CMD
                        fi;
                fi;

    echo "------------------------------------------";
done
