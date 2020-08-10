#! /bin/bash
set +x


file=/usr/zaghir/file.txt

### stop debugging at this place 
set +x 

trap "rm -f $file && echo file deleted  ; exit" 0 2 15
echo "pid is $$"
while (( COUNT < 10 ))
do 
    sleep 10 
    (( COUNT ++ ))
    echo "COUNT = $COUNT"
done
exit 0


### to execute a script in debug mode 

### method 1 
### run script in CLI with 
### bash -x ./hello.sh

### method 2
### replace  --> #! /bin/bash   with  #! /bin/bash -x

### method 3
### use set -x   in the script to activate debugging 

### use set +x   in the script to stop debugging 


