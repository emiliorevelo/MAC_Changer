#!/bin/bash

#Emilio Revelo

if [[ $1 == '-i' ]]
then
echo
echo "Available interfaces:" && echo && ifconfig | awk 'NR==1{print $NR}' | sed 's/:.*//' && ifconfig | grep -A1 '^$' | sed 's/:.*//' | tr -d '-' | awk /./ && echo && echo "MAC Addresses:" && echo &&ifconfig -a | awk '{for(i=1;i<=NF;i++)if($i=="ether")print $(i+1)}'
echo 
elif [[ $1 == "-h" || -z $1 || -z $2 ]]
then
echo
echo "Use -i in order to see your available network interfaces"
echo
echo "Example usage: ./changemac.sh eth0 0c:02:03:04:05:06"
echo
elif [[ $1 && $2 ]]
then
ifconfig  $1 hw ether $2
fi

