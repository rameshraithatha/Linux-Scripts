#!/bin/bash

if [ $# -eq 0 ]
then
	echo  -e "Enter 'c' for creating users OR 'r' for removing users \nFor example: bash drupal_create_account.sh c"
	exit
fi

#get mysql password.
read -p "Enter mysql password:" -s pass;echo ""




#c = create
if [[ $1 == "c" ]]
then
#For loop creating usernames from 11030142001 to 11030142117	
	for (( i=11030142001;i<=11030142117;i++ ))
		do
			#mysql query to add username,password,mail id,status (i.e Active/Blocked state)
			mysql -u root -p$pass -e "use drupal;INSERT INTO users(uid,name,pass,mail,status)VALUES(($i-11030142000)+1,$i,md5($i-11030142000),'$i@sicsr.ac.in',1);"	
		done
	
#r = remove
elif [[ $1 == "r" ]]
then
#For loop removing usernames from 11030142001 to 11030142117	
	for (( i=11030142001;i<=11030142117;i++ ))
		do
			#mysql query to delete all accounts having uid greator than 1 ( **remove comment if in use** )	
			mysql -u root -p$pass -e "use drupal;delete FROM users where uid=($i-11030142000)+1;delete from users_roles where uid>1;"
		done	
fi








