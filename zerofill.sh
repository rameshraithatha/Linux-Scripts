#!/bin/bash

while [ 1 ]
do
       for var in "$@"
       do
               echo -n 0 >> "$var"/zero-fill
       done
done

#Sites refered -------------
#-->http://www.linuxquestions.org/questions/linux-newbie-8/pipe-output-to-append-to-a-text-file-86174/
#-->http://tldp.org/LDP/abs/html/subshells.html
