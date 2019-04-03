#!/bin/bash

# ZNC account creation
CONF="/var/lib/znc/.znc/configs/znc.conf"
PID=$(pgrep -u znc znc)
NEWCONF="/var/lib/znc/znc_account.newconf"

# $username and $password are retrieved from create-account script
if [[ -z $1 || -z $2 ]]
then    
	echo -e "Usage: $(basename $0) [username] [password]"
        exit
fi

# search if $username has been added previously
if grep -iq $1 $CONF
then    
        echo -e "User: '$1' already exists"
        exit
fi

username=$1
password=$2

kill -s USR1 $PID # Rewrite znc.conf
sleep 1

# set username and password
sed s/newuser/$username/g $NEWCONF >> $CONF
expect << EOF | grep -E 'Hash|Salt' | tr -d \\r >> $CONF
spawn znc --makepass
expect "*Enter password: "
send "$password\r"
expect "*Confirm password: "
send "$password\r"
expect eof
EOF
echo "  </Pass>" >> $CONF
echo "</User>" >> $CONF

sleep 1
kill -s HUP $PID # Reload znc.conf
sleep 1
kill -s USR1 $PID # Rewrite znc.conf
