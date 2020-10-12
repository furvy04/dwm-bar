#!/bin/bash

#dwm-bar function to display cpu percentage, used ram, date and time.
#GNU GPL-3.0

while :
	do
		
		# Cpu Used Percent
		CPU=$(awk '{u=$2+$4; t=$2+$4+$5;if (NR==1){u1=u; t1=t;} else printf("%d%%", ($2+$4-u1) * 100 / (t-t1) "%");}' <(grep 'cpu ' /proc/stat) <(sleep 0.5; grep 'cpu ' /proc/stat))

		# Used Ram
		RAM=$(awk '/^Mem/{print $3}' <(free -m)) 
		
		# Date and Time
		DATE=$(date +"%x %H:%M") 

		xsetroot  -name  " CPU $CPU | RAM $RAM MB | $DATE "

	 sleep 1
 done
