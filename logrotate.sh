#!/bin/bash

#
# Write a script for logrotate. Allow user to input the file name and maximum number of files to be kept.
# Date : Wed Jul 25, 2012
#

fname=$1								#-- File name
nof=$2									#-- Maximum number of files to be kept

if [ -f $fname ]							#-- Checks if file is present or not
then
	if [ -f "$fname".1 ]						#-- Checks if file has a backup or not
	then
		for (( i=1 ; i<=$nof ; i=i+1 ))
		do
			if [ -f "$fname".$i ]	
			then
				temp=`expr $i + 1`			#-- Temporary value
				`mv "$fname".$i "$fname".$temp.bk`	#-- Create a backup of the current backup file ( for ex. syslog.2.bk )
			fi
		done
	fi
	for (( i=1 ; i<=$nof ; i=i+1 ))
	do
		if [ -f "$fname".$i.bk ]
		then
			`mv "$fname".$i.bk "$fname".$i`			#-- Moves the backup file to its original place ( for ex. syslog.2 )
		fi
	done
	`mv $fname "$fname".1`
	`touch $fname`

	for  i in `ls -l | grep sl | cut -d " " -f12 | cut -d. -f2`
	do
		if [[ $i -ge $nof || $i == $nof ]]
		then
			`rm -f "$fname".$i 2> logrotate.log`		#-- Removes the files which dosent matches the criteria of $nof
			if [ -f "$fname".$i.bk ]
			then
				`rm -f "$fname".$i.bk2> logrotate.log`	#-- Removes any extra backup files created that dosent matches the criteria of $nof
			fi
		fi
	done

else
	touch $fname
fi




