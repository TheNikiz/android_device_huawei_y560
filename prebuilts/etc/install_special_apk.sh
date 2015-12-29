#! /system/bin/sh
# add by wangtianyu for (SW00120035) 2015-04-07 
LOG_TAG="install_special_app"
LOG_NAME="${0}:"
loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}
logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

MCCMNC=`getprop ril.imsi.mccmnc`
SIMSTATE=`getprop gsm.sim.state`

#check if already adaptived apps 
#add by wangtianyu for (SW00149181) 2015-06-16 
RUNNED=`getprop persist.sys.hideapk`
if [ ${#RUNNED} -gt 2 ]; then
  logi "install_special_app already runned "
  exit 1
fi

#wait for sim state ready begin
waitseconds=3000
count=1
while [ ${#SIMSTATE} -lt 2 ] && [ $count -lt $waitseconds ]
 do
          sleep 1
          logi "SIMSTATE $SIMSTATE wait $count seconds "
          SIMSTATE=`getprop gsm.sim.state`
          count=$(( count + 1 ))
         
done
#wait for sim state ready end

#wait for sim state ready begin
waitseconds=3000
count=1
while [ ${SIMSTATE} = "NOT_READY" ] && [ $count -lt $waitseconds ]
 do
          sleep 1
          logi "SIMSTATE $SIMSTATE wait $count seconds "
          SIMSTATE=`getprop gsm.sim.state`
          count=$(( count + 1 ))
         
done
#wait for sim state ready end

#add by wangtianyu for (SW00148342) 2015-06-09 begin
waitseconds=10
count=1
while [ ${SIMSTATE} = "ABSENT" ] && [ $count -lt $waitseconds ]
 do
          sleep 1
          logi "SIMSTATE $SIMSTATE wait $count seconds "
          SIMSTATE=`getprop gsm.sim.state`
          count=$(( count + 1 ))
         
done
#wait for sim state ready end
#add by wangtianyu for (SW00148342) 2015-06-09 end

if [ $SIMSTATE = "ABSENT" ]; then
   logi "disable app ABSENT"
   pm disable com.huawei.android.nationalapplication
   pm disable com.pagesjaunes
   exit 1
fi


if [ $SIMSTATE = "NOT_READY" ]; then
   logi "disable app NOT_READY"
   pm disable com.huawei.android.nationalapplication
   pm disable com.pagesjaunes
   exit 1
fi


#wait for mcc mnc ready begin 
waitseconds=6000
count=1
while [ $count -lt $waitseconds ] && [ ${#MCCMNC} -lt 3 ] 
        do
          sleep 1
          logi "MCCMNC is $MCCMNC wait sim ready $count seconds"
          MCCMNC=`getprop  ril.imsi.mccmnc`
          count=$(( count + 1 ))
done
#wait for mcc mnc ready end 

logi "mcc mnc string is $MCCMNC"
if [ ${#MCCMNC} -gt 3 ]; then
    #if only card 2 , the sting will start with , 

    MCC=${MCCMNC:0:3}

    # wangxuan add to disable cbwidget
    if [ $MCC != "724" ]; then
    logi "wangxuan disable cb $MCCMNC"
    pm disable com.android.cellbroadcastreceiver.widget
    fi
    # wangxuan add to disable cbwidget
    
    # wangtianyu for  (SW00142211) 2015-05-20 begin
    if [ $MCC != "208" ]; then
    logi "disable pagesjaunes $MCCMNC"
    pm disable com.pagesjaunes
    else
    pm enable com.pagesjaunes
    fi
    # wangtianyu for  (SW00142211) 2015-05-20 end
    
    if [ $MCC  ==  "724" ]; then
    logi "install NationalApplication"
    pm enable com.huawei.android.nationalapplication
    else
    logi "disable NationalApplication"
    pm disable com.huawei.android.nationalapplication
    fi
    #add by wangtianyu for (SW00149181) 2015-06-16 
    setprop persist.sys.hideapk true
    #add by wangtianyu for (SW00156928) 2015-07-09 begin
    logi "send $MCC broadcast to settings"
    am broadcast -a com.android.settings.action.MATCH_CARD --ei mcc $MCC &
    #add by wangtianyu for (SW00156928) 2015-07-09 end
    
    logi "MCC is $MCC and send broadcast to launcher"  
    #send broadcast to launcher
    am broadcast -a com.android.launcher.action.MATCH_CARD --ei mcc $MCC &
    
else
 logi "no valid mccmnc"
fi

