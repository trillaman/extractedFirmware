#!/bin/sh

wrcsman "0x80010043 0"
UI_PASS=`rdcsman 0x00010002 str` # Current UI password
DEF_PASS=`rdcsman 0x0001003e str` # Default UI password in reset.txt

if [ "$UI_PASS" != "$DEF_PASS" ] ; then
    wrcsman "0x80010043 1" # Default UI password has been changed
fi
