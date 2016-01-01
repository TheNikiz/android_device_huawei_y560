#!/xbin/sh
#/data/system/netconfig.txt
NETCONFIG_FILE=/data/system/netconfig.txt
LOG_TAG="iptables"
LOG_NAME="${0}:"
loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}
logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

if [ -f "$NETCONFIG_FILE" ];then
    while read line
    do 
        logi "read: $line"
       /system/bin/sh /system/etc/iptables_run.sh  $line
    done </data/system/netconfig.txt
else
    loge "iptables config file not exist"
fi
