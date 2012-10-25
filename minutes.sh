#!/bin/bash



###############################################################################
#-------------------------------- minutes v1----------------------------------#
#Created by : Ramesh Raithatha 						      #
#				                                              #
#Date : 25 October, 2012                                                      #
#                                                                             #
#Description : This bash script will calculate the minutes left from the      #
#given time								      #
#                                                                             #
#USE : minutes [hh:mm] [hh] [pm]                                              #
#                                                                             #
#Example : minutes 10:25 pm                                                   #
#                                                                             #
###############################################################################


#NOTE- This bash script will find minutes for 24 hours only i.e it can calculate minutes only for the current day.



#---count how many minutes are there between given time and present time----

#System current time------

sys_h=`date +%k` #System Hour in 1..23 format
sys_m=`date +%M` #System Minute in 00..59 format

#--------------------------------------------------------------------------

user_h=0   #Variable to store hours of the user
user_m=0   #Variable to store minutes of the user

#--------------------------------------------------------------------------


if echo $1 | grep -E ^\([01]?[0-9]\|2[0-3]\):\([0-5]?[0-9]\)$ > /dev/null
then
	user_h=`echo $1 | cut -d: -f 1`
	user_m=`echo $1 | cut -d: -f 2`
elif echo $1 | grep -E ^\([01]?[0-9]\|2[0-3]\)$ > /dev/null
then
	user_h=`echo $1 | cut -d: -f 1`
	user_m=0
else
	echo "Please enter time in proper format"
	exit 1
fi




if [[ $2 -eq pm && user_h -eq 0 ]]
then
	echo "Invalid date!"
	exit 1
elif [[ $2 == pm ]]
then
	user_h=$(($user_h + 12))
fi




if [[ $sys_h -gt $user_h ]]
then
	final_h=$(( (24 - $sys_h) + $user_h ))
elif [[ $sys_h -lt $user_h ]]
then
	final_h=$(( $user_h - $sys_h ))
else	
	final_h=0
fi


if [[ $sys_m -gt $user_m ]]
then
	final_m=$(( (60 - $sys_m) + $user_m ))
	final_h=$(( $final_h - 1 ))
elif [[ $sys_m -lt $user_m ]]
then
	final_m=$(( $user_m - $sys_m ))
else
	final_m=0
fi


final_time=$(( (60 * $final_h) + $final_m ))  #final time in minutes


if echo $final_time | grep -E \(-[09]*\) > /dev/null
then
	echo You are running `echo $final_time | cut -d - -f2` minute[s] late! #"cut" is used to remove '-' sign from the variable that is "-12" would be showed as "12"
else
	echo You have $final_time minutes left!
fi

