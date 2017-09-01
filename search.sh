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
	echo "${bold}${blue}>>>>${gold}>>>>${green}>>>>${reset}" | pv -qL 10
	sleep 3
	clear
	echo -n "[ "
	echo -n "${bold}${blue}$1${reset}"
	echo -n " = ${bold}${green}TRUE${reset}"
	echo " ]"
	read -s -n1
	clear
	rm /home/$(whoami)/.shlib-search.log
	clear
else
	clear
	echo "${bold}${blue}>>>>${gold}>>>>${green}>>>>${reset}" | pv -qL 10
	sleep 3
	clear
	echo -n "[ "
	echo -n "${bold}${blue}$1${reset}"
	echo -n " = ${bold}${red}FALSE${reset}"
	echo " ]"
	read -s -n1
	clear
	rm /home/$(whoami)/.shlib-search.log
	clear
fi

clear


	
