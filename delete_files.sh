#!/bin/bash

#
# write a script which will find all files older than 10 days and starting with the letter R in their name but not having d extension .com and delete those files.
#

date=`date +%d`
month=`date +%m`

#if [ $month -eq 1 || $month -eq 3 || $month -eq 5 || $month -eq 7 || $month -eq 8 || $month -eq 10 || $month -eq 12 ))
#then
#	no=21
#elseif [ $month -eq 2 && 
no=20
if [ $date -gt 10 ]
then
	check_date=`expr $date - 10`
	check_month=$month
else
	for (( i=1 ; i<=10 ; i++ ))
	do
		if [ $date -eq $i ]
		then
			check_date=`expr $no + $i`
		fi
		if [ $month -eq 1 ]
		then
			check_month=12
		else
			check_month=`expr $month - 1`
		fi
	done
fi

for  i in `ls`
do
	ts_month=`stat -c %y $i | cut -d- -f2`	#ts=timestamp
	ts_date=`stat -c %y touch1 | cut -d" " -f1 | cut -d- -f3`
	if [[ $ts_month -lt $check_month && ts_date -lt $check_date ]]
	then
		if [[ $i == *.com ]]
		then
			`ls > /dev/null`
		else
			if [[ $i == r* ]]
			then
			`	rm -f $i`
			fi
		fi
	fi
done







