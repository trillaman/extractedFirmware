#!/bin/sh

wrcsman "0x80070002 1"
rc=2

time_server=$1

if [ "$time_server" = "AUTO" ];then
	time_server=""
fi


if [ "$time_server" != "" ]
then
	NTP $time_server
else
	NTP
fi

[ $? -ne 0 ] && rc=3
wrcsman "0x80070002 $rc"

exit $rc

