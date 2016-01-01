#!/xbin/sh
# UID X X

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

echo $1
echo $2
echo $3
case $2 in
0)      logi "disable data for $1"
        echo "disable data for $1"
        iptables -D OUTPUT -o rmnet+  -m owner --uid-owner $1 -j DROP
        iptables -A OUTPUT -o rmnet+  -m owner --uid-owner $1 -j DROP
        ;;
1)      logi "enable data for $1"
        echo "ensable data for $1"
        iptables -D OUTPUT -o rmnet+  -m owner --uid-owner $1 -j DROP
        ;;
esac
case $3 in
0)      logi "disable wlan for $1"
        echo "disable wlan for $1"
        iptables -D OUTPUT -o wlan+  -m owner --uid-owner $1 -j DROP
        iptables -A OUTPUT -o wlan+  -m owner --uid-owner $1 -j DROP
        ;;
1)      logi "enable wlan for $1"
        echo "enable wlan for $1"
        iptables -D OUTPUT -o wlan+  -m owner --uid-owner $1 -j DROP
        ;;
esac

