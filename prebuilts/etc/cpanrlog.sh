#! /system/bin/sh
#mkdir /storage/sdcard0/aplog/anr
#mkdir  /storage/sdcard0/aplog/tombstones
anrlogname="anr_"$(date +"%Y-%m-%d_%H-%M-%S")
tomblogname="tombstone_"$(date +"%Y-%m-%d_%H-%M-%S")
screenshotname="screenshot_anr_"$(date +"%Y-%m-%d_%H-%M-%S")

loglocation=`getprop sys.log.location`
aplogpath="/storage/sdcard0/logs/aplog"

case "$loglocation" in
    "1")
    aplogpath="/storage/sdcard0/logs/aplog"
    ;;
    "0")
    aplogpath="/storage/sdcard1/logs/aplog"
    ;;
    *)
    aplogpath="/storage/sdcard0/logs/aplog"
    ;;
esac
#mkdir -p  $aplogpath
cat /data/anr/* > $aplogpath/$anrlogname.txt
screencap -p $aplogpath/$screenshotname.png

