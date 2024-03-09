#! /bin/sh

PATH="/proc/net/dev"

WTXB=`cat $PATH | grep eth2.2 | awk '{printf $2}'`
WRXB=`cat $PATH | grep eth2.2 | awk '{printf $10}'`
LTXB=`cat $PATH | grep br0 | awk '{printf $2}'`
LRXB=`cat $PATH | grep br0 | awk '{printf $10}'`
WLTXB=`cat $PATH | grep ra0 | awk '{printf $2}'`
WLRXB=`cat $PATH | grep ra0 | awk '{printf $10}'`

sleep 1

N_WTXB=`cat $PATH | grep eth2.2 | awk '{printf $2}'`
N_WRXB=`cat $PATH | grep eth2.2 | awk '{printf $10}'`
N_LTXB=`cat $PATH | grep br0 | awk '{printf $2}'`
N_LRXB=`cat $PATH | grep br0 | awk '{printf $10}'`
N_WLTXB=`cat $PATH | grep ra0 | awk '{printf $2}'`
N_WLRXB=`cat $PATH | grep ra0 | awk '{printf $10}'`

WTXR=$((($N_WTXB-$WTXB)/8))
WRXR=$((($N_WRXB-$WRXB)/8))
LTXR=$((($N_LTXB-$LTXB)/8))
LRXR=$((($N_LRXB-$LRXB)/8))
WLTXR=$((($N_WLTXB-$WLTXB)/8))
WLRXR=$((($N_WLRXB-$WLRXB)/8))

WTXP=`cat $PATH | grep eth2.2 | awk '{printf $3}'`
WRXP=`cat $PATH | grep eth2.2 | awk '{printf $11}'`
LTXP=`cat $PATH | grep br0 | awk '{printf $3}'`
LRXP=`cat $PATH | grep br0 | awk '{printf $11}'`
WLTXP=`cat $PATH | grep ra0 | awk '{printf $3}'`
WLRXP=`cat $PATH | grep ra0 | awk '{printf $11}'`

WCOLLS=`cat $PATH | grep eth2.2 | awk '{printf $15}'`
LCOLLS=`cat $PATH | grep br0 | awk '{printf $15}'`
WLCOLLS=`cat $PATH | grep ra0 | awk '{printf $15}'`

awk 'BEGIN{printf '$WTXP'"|"'$WRXP'"|"'$WCOLLS'"|"'$WTXR'"|"'$WRXR'"-"}'
awk 'BEGIN{printf '$LTXP'"|"'$LRXP'"|"'$LCOLLS'"|"'$LTXR'"|"'$LRXR'"-"}'
awk 'BEGIN{printf '$WLTXP'"|"'$WLRXP'"|"'$WLCOLLS'"|"'$WLTXR'"|"'$WLRXR'}'
