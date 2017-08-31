#!/bin/bash

clear

source <(curl -s https://raw.githubusercontent.com/alectramell/shlib/master/colors.sh)

clear

WEBLIST=($(curl -s https://raw.githubusercontent.com/alectramell/shlib/master/catalog.txt))

clear

echo ${WEBLIST[*]} > /home/$(whoami)/.shlib-search.log

clear

CHSEARCH=$(grep -o -c "$1" /home/$(whoami)/.shlib-search.log)

clear

if [ $CHSEARCH -eq 1 ] || [ $CHSEARCH -gt 0 ]
then
	clear
	echo -n "USER "
	echo -n $(grep -o $1 /home/$(whoami)/.shlib-search.log)
	echo " IS registered in the catalog.."
	read -s -n1
	clear
else
	clear
	echo -n "USER "
	echo -n "$1"
	echo " IS NOT registered in the catalog.."
	read -s -n1
	clear
	rm /home/$(whoami)/.shlib-search.log
fi

clear


	
