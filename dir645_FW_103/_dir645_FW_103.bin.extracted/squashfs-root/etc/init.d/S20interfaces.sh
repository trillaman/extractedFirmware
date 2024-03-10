#!/bin/sh
insmod /lib/modules/rtldrv.ko

if test -f "/proc/net/if_inet6" ;
then
	echo 2 > /proc/sys/net/ipv6/conf/eth2/accept_dad
	echo 1 > /proc/sys/net/ipv6/conf/eth2/disable_ipv6
fi
MACADDR=`devdata get -e wanmac`
[ "$MACADDR" != "" ] && ip link set eth2 addr $MACADDR
ip link set eth2 up
vconfig set_name_type DEV_PLUS_VID_NO_PAD
#lan 1 : 3 lan 2 : 2 lan 3 :1 lan4 : 4 /*4 is the highest */
#rtlioc portbaseqos enable port4_pri port3_pri port2_pri port1_pri
rtlioc portbaseqos enable 4 1 2 3