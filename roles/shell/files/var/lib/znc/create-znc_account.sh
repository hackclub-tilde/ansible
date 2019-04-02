#!/bin/bash

# ZNC account creation
CONF="/var/lib/znc/.znc/configs/znc.conf"
PID=$(pgrep -u znc znc)

# $username and $password are retrieved from create-account script
if [ -z $1 ]
then    
        echo -e "Usage: $(basename $0) [username]"
        exit
fi

# search if $username has been added previously
if grep -iq $1 $CONF
then    
        echo -e "User: '$1' already exists"
        exit
fi

username=$1

kill -s USR1 $PID # Rewrite znc.conf
sleep 1

# set username
sed s/newuser/$username/g znc_account.newconf >> $CONF

sleep 1
kill -s HUP $PID # Reload znc.conf
sleep 1
kill -s USR1 $PID # Rewrite znc.conf
