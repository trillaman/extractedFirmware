#!/bin/sh
#This script is a workaround for issue 
#  : 5G disabled, 2.4G can't connect. 
#So we bring 5G module up in INIT. Remember that WLAN-2 is 5G.
#xmldbc -P /etc/services/WIFI/init5Gwlan.php > /var/init5Gwlan.sh
#chmod +x /var/init5Gwlan.sh
#/bin/sh /var/init5Gwlan.sh

#we only insert wifi modules in init. 
xmldbc -P /etc/services/WIFI/init_wifi_mod.php > /var/init_wifi_mod.sh
chmod +x /var/init_wifi_mod.sh
/bin/sh /var/init_wifi_mod.sh

