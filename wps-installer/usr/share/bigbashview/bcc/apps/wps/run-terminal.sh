#!/bin/bash

xtermset -geom 52x14+70+110

OLDIFS=$IFS
IFS=$'\n'

if [ "$1" = "remove" ]; then
    dpkg -P wps-office
fi

if [ "$1" = "" ]; then
    rm -Rf /tmp/wps-download
    mkdir /tmp/wps-download
    cd /tmp/wps-download
    wget -c $(cat /tmp/wps-link.txt)
    dpkg -i /tmp/wps-download/*.deb
    rm -Rf /tmp/wps-download
fi
