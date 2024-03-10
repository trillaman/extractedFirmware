#!/bin/sh
UPNPMSG=`xmldbc -g /runtime/upnpmsg`
[ "$UPNPMSG" = "" ] && UPNPMSG="/dev/null"
echo "[$0] ..." > $UPNPMSG

SVC="WANIPv6Firewall1"
PHP="NOTIFY.WANIPv6Firewall.1.php"
SCRIPT="/var/run/PROPCHANGE.$SVC.$$.sh"

xmldbc -P /etc/scripts/upnp/run.NOTIFY-PROPCHANGE.php -V SERVICE=$SVC -V TARGET_PHP=$PHP > $SCRIPT
echo "rm $SCRIPT" >> $SCRIPT
sh $SCRIPT &
