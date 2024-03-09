#!/bin/sh

#cat /proc/stat | grep cpu0
PRE_ALL=`cat /proc/stat | grep cpu0 | awk '{printf $2+$3+$4+$5+$6+$7+$8+$9}'`
PRE_NOIDLE=`cat /proc/stat | grep cpu0 | awk '{printf $2+$3+$4+$6+$7+$8+$9}'`
sleep 1
#cat /proc/stat | grep cpu0
NEXT_ALL=`cat /proc/stat | grep cpu0 | awk '{printf $2+$3+$4+$5+$6+$7+$8+$9}'`
NEXT_NOIDLE=`cat /proc/stat | grep cpu0 | awk '{printf $2+$3+$4+$6+$7+$8+$9}'`

#echo "PRE_ALL=$PRE_ALL, NEXT_ALL=$NEXT_ALL, PRE_NOIDLE=$PRE_NOIDLE, NEXT_NOIDLE=$NEXT_NOIDLE"

ALL=`expr $NEXT_ALL - $PRE_ALL`
NODILE=`expr $NEXT_NOIDLE - $PRE_NOIDLE`
CPULOAD=$(($NODILE*100/$ALL))
MEMTOTAL=`free|grep 'Mem'|awk '{printf $2}'`
MEMUSED=`free|grep 'Mem'|awk '{printf $4}'`
MEMUT=$(($MEMUSED*100/$MEMTOTAL))

awk 'BEGIN{printf '$CPULOAD'"|"'$MEMUT'}'

#wrcsman "0x00160020 $CPULOAD"
#wrcsman "0x00160021 $MEMTOTAL"
#wrcsman "0x00160023 $MEMUSED"
#wrcsman "0x00160024 $MEMUT"

#echo "CPULOAD=$CPULOAD"
#echo "MEMTOTAL=$MEMTOTAL"
#echo "MEMUSED=$MEMUSED"
#echo "MEMLOAD=$MEMUT"
