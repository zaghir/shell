###  Docker Container 
```
using docker container 
docker network create mysql-network
docker container prune
docker run --detach --env MYSQL_ROOT_PASSWORD=admin --env MYSQL_USER=todos-user --env MYSQL_PASSWORD=todos-pass --env MYSQL_DATABASE=todos --network mysql-network  --volume C:\Devs-and-tools\project\shell:/usr/zaghir --name mysql --publish 3307:3306 mysql:5.7

docker exec -it mysql bash
```

### Shell 
```
show all shell supported by the system 
--------------------------------
---> # cat /etc/shells
# /etc/shells: valid login shells
/bin/sh
/bin/bash
/bin/rbash
/bin/dash

location bash 
------------------------------
-->  which bash
/bin/bash

create folder
------------------------------
--> mkdir zaghir
cd zaghir 

create file hello.sh
------------------------------
touch hello.sh

ls -al 

drwxr-xr-x 2 root root 4096 Aug  6 15:17 .
drwxr-xr-x 1 root root 4096 Aug  6 15:11 ..
-rw-r--r-- 1 root root    0 Aug  6 15:17 hello.sh
hello.sh has 
   -rw  : read and write for you ()
   -r   : read for group 
   --r  : read permission for user 


```
bash ==> Born Again shell 


### Create file hello.sh
```
# declare location of bash 
# to know all bash supported by the system  use
# cat /etc/shells
# location bash 
#! /bin/bash
echo "Hello world!"
# to execute in terminale execute
# ./hello.sh

```
### Create file hello.sh
```
to execute hello.sh we need to change permission , because user has only read permision 

# chmod +x hello.sh
# ls -al

drwxrwxrwx 2 root root 4096 Aug  7 08:50 .
drwxr-xr-x 1 root root 4096 Aug  7 08:44 ..
-rwxr-xr-x 1 root root 1532 Aug  7 09:05 Readme.md
-rwxr-xr-x 1 root root  191 Aug  7 09:01 hello.sh

before 
   -rw-r--r-- 1 root root    0 Aug  6 15:17 hello.sh
after   
   -rwxr-xr-x 1 root root  191 Aug  7 09:01 hello.sh
group and user have permission to execute command  => -x 



```

### variables 
```
   2 types off variables 
      1. System varibles 
         define with capitale varible 

      2. User define varibles 

# Bash shell name  it s system varible 
echo Our shell name is $BASH
echo Our shell version is $BASH_VERSION
echo Our home directory is $HOME
echo Our current working directory is $PWD

# create a varible 
name=ZAGHIR
echo The name is  $name
```

### read user Input 
```
# echo "Enter name : "

### command for reading 
# create also name varible 
# read name 
# echo "Enter name : $name "

### create multi varibles 
# read name1 name2 name3
# echo "Names : $name1 , $name2 , $name3"

### print input an the same line or prompt  -p => prompt 
# read -p 'username : ' username_var
# read -p 'age : ' age_var

# input type silent like password -s => silent 
# read -sp 'password : ' pass_var

# echo " username :  $username_var  , age :  $age_var  , password : $pass_var"

### input data in array  array => -a
# echo "Enter names :"
# read -a names 
# echo "Named :  ${names[0]} , ${names[1]} "

### not specify varible  called built-in
### by default the value it s storage in $REPLY 
echo "enter name : "
read 
echo "Name : $REPLY"

```

### Pass Arguments to bash-script
```
### arrguments passed to bash script into varibles $1 $2 $3 
echo $0 $1 $2 $3 ' > echo $1 $2 $3 '

### execute script  :  ./hello.sh  Youssef Meriem Yasssine  
### the argument start on 1 and 2 ....

### passing arguments into array 
### $@  store arguments as array and pass them 
args=("$@") 

echo ${args[0]} ${args[1]} ${args[2]} 

echo "all values with '\$@' ==> " $@ 

### print numbers of arguments pass to the script 
echo "number of args '\$#' ==> " $# 

```

### If statement (if then , if then else , if elif else)
```
# if [condition ]
# then 
#   stetement
# fi

# -eq - is equal to - if ["Sa" -eq "Sb"]
# -ne - is not equal to - if ["Sa" -ne "Sb"]
# -gt - is greater than - if ["$a" -gt "$b"]
# -ge - is greater than or equal - if ["$a" -ge "$b"]
# -lt - is less than - if ["$a" -lt "$b"]
# -le - is less than or equal - if ["$a" -le "$b"]
# <   - is less than - (("$a" < "$b"))
# <=  - is less than or equal to - (("$a" <= "$b"))
# >   - is greater than - (("$a" > "$b"))
# >=  - is greater than or equal to - (("$a" >= "$b"))

# string comparison 
# =  - is equal to - if [ "$a" = "$b" ]
# == - is equal to - if [ "$a" == "$b" ]
# != - is not equal to - if [ "$a" != "$b" ]
# < - is less than , ins ASCII alphabeticals order if [[ "$a" < "$b"]]
# > - is greater than , ins ASCII alphabeticals order if [[ "$a" > "$b"]]
# -z - string is null , that is has zero length

count=10

if [ $count -gt 8 ]
then
  echo "condition is true    comparation with  []"
fi

if (($count > 8))
then
  echo "condition is true    comparation with  (())"
fi

word=Python
if [ $word == "Java" ]
    then 
        echo " java word"
elif [ $word == "Python" ]
    then 
        echo " Python word"
else
    echo " is not java word"
fi 

```

### File test operators
```
#! /bin/bash

### \c keep the cursor in the same line of the end of echo 
### -e enable the interpretation of the backslash
echo -e "Enter the name of the file : \c"
read file_name 

echo " search file $file_name"
### -e  => exite file 
# if [ -e $file_name ]
# then 
#   echo "$file_name --> found "
# else 
#   echo "$file_name --> not found "
# fi

### -f it s a regular file or not 
# if [ -f $file_name ]
# then 
#   echo "$file_name --> is a folder"
# else
#   echo "$file_name-->  is a file "
# fi 

### -d check for the directories 
### create new directory for exemple  pictures 
# mkdir pictures
### run script hello.sh  , in input search dir
# if [ -f $file_name ]
# then 
#   echo "$file_name --> directory found  "
# else
#   echo "$file_name --> directory not found "
# fi 


### -s file not empty
# if [ -s $file_name ]
# then 
#   echo "$file_name --> not empty  "
# else
#   echo "$file_name --> empty "
# fi

### -w check write permission
# if [ -w $file_name ]
# then 
#   echo "$file_name --> write permission   "
# else
#   echo "$file_name --> no write permission "
# fi

### -x check write permission
# if [ -x $file_name ]
# then 
#   echo "$file_name --> execute permission   "
# else
#   echo "$file_name --> no execute permission  "
# fi

```
### append output to the end of text file 
```
echo -e "Enter the name of the file : \c"
read file_name

if [ -f $file_name ]
then 
    if [ -w $file_name ]
    then 
        echo "Type some text data. to quit press ctrl+d "
        # file overwritten when we use > 
        # file will be append when we use >>   the text will be  appended to the  text
        cat >> $file_name        
    else
        echo "the file do not have write permission"
    fi 
else 
    echo "$file_name not exists "
fi 


### create file 
# touch test
### remove write permission for test file 
# chmod -w test
### show files and permission s
# ls -al

### add write permission for test file 
# chmod +w test

# verify the content file 
# cat test           or use vi test 
```

### Logical 'AND'  Operator
```
age=25
if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
  then 
    echo "valid age"
  else 
    echo "age not valid"
fi

### second solution for AND operation 
### -a => and
if [ "$age" -gt 18 -a "$age" -lt 30 ]
  then 
    echo "valid age v2"
  else 
    echo "age not valid v2 "
fi

### oder solution for AND operation 
### -a => and
if [[ "$age" -gt 18 && "$age" -lt 30 ]]
  then 
    echo "valid age v3"
  else 
    echo "age not valid v3 "
fi
```

### Logical 'OR'  Operator
```
age=50

if [ "$age" -eq 18 ] || [ "$age" -eq 30 ]
  then 
    echo "valid age"
  else 
    echo "age not valid"
fi

### using -o => OR with [[ condition -o  condition ]]
if [ "$age" -eq 18 -o "$age" -eq 30 ]
  then 
    echo "valid age"
  else 
    echo "age not valid"
fi

### using || => OR with [[ condition ||  condition ]]
if [[ "$age" -eq 18 || "$age" -eq 30 ]]
  then 
    echo "valid age"
  else 
    echo "age not valid"
fi

```
### Perform arithmetic operation  
```
num1=20
num2=5

# num1 and num2  not evaluated 
echo $num1 - $num2

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

# using expr 
echo $( expr $num1 + $num2 )
echo $( expr $num1 - $num2 )
echo $( expr $num1 \* $num2 )
echo $( expr $num1 / $num2 )
echo $( expr $num1 % $num2 )
```

### Floating point math operations in bash | bc command   bc => basic calculator
```
# if bc not installed 
apt install bc         or   yum install bc 

```

### The case statement 
```
# case expresion in 
#     pattern1 )
#         statements ;; 
#     pattern2 ) 
#         statements ;; 
#     ...
# esac

# vehicle=$1

# case $vehicle in 
#     "car" )
#         echo "Rent of $vehicle is 100 dollar" ;;
#     "van" )
#         echo "Rent of $vehicle is 80 dollar" ;;
#     "bicycle" )
#         echo "Rent of $vehicle is 5 dollar" ;;
#     "truck" )
#         echo "Rent of $vehicle is 150 dollar" ;;
#     * )
#         echo " Unknown vehicle" ;;
# esac    

### * == default 
### execute code  ./hello.sh van 

### evaluated
echo -e "Enter some character : \c"
read value

case $value in 
    [a-z] )
        echo "user entered $value ==> a to z" ;;
    [A-Z] )
        echo "user entered $value ==> A to Z" ;;
    [0-9] )
        echo "user entered $value ==> 0 to 9" ;;
    ? )
        echo "user entered $value ==> special character" ;;
    * )
        echo "unknow input" ;;
esac

### when you have a problem use LANG=C  varible environement in the terminal
# LANG=C
```

### Array varibles
```
### bash suport one dimension array 

os=('ubuntu' 'windows' 'kali')
os[3]='mac' 
echo "${os[@]}"
echo "${os[1]}"
### index of array
echo "${!os[@]}"
### length
echo "${#os[@]}"
### update value of arrey
os[0]='mac'
echo "${os[@]}"
### delete element of array 
unset os[2]
### add element on 10 index
os[10]='mac' 
### taking a string as an array 
### you can treat any variable as an array , the first element of array it s value of varible 
string=abcdefgh
echo "${string[@]}"
echo "${string[0]}"
echo "${string[1]}"
### the lenght of array it s  1
echo "${#string[@]}"

```

### WHILE LOOP
```
# while [ condition ]
# do 
#     command1
#     command2
#     command3
# done

n=1

while [ $n -le 10 ]
do 
    echo "n ====> $n"
    # n=$(( n+1 )) 
    # (( ++n ))
    (( n++ ))
done

n=1
while (($n <= 10)) 
do 
    echo "n **** $n"
    (( n++ ))
done

n=1
while [ $n -le 10 ]
do 
    echo "n ==> $n"
    (( ++n ))
    sleep 1  ### sleep 1s and execute rest of code 
done

n=1
### open 3 terminals 
while [ $n -le 10 ]
do 
    echo "n ==> $n"
    (( n++ ))
    # gnome-terminal &
    xterm &
done

```

###  Read a file content in bash  
```
### read file content line by line 
### p => parameter 
# while read p 
#     do 
#         echo $p 
# done < hello.sh

### IFS  Internal field separator it is used by the shell to determine how to do word splitting and that how to recognize the boundaries . we can use IFS=' ' also

### we are not assigning read to IFS , we are assigning a space to an IFS and we use a read command after assigning IFS=  .spasce
### -r prevents the backslash escape from being interpreted
### line it s more descriptive of this method 
while IFS= read -r line  
    do 
        echo $line

done < hello.sh

### we can use cat method to read content file 
# cat /etc/host.conf
```

### UNTL LOOP
```
### until => condition is false the commands will be executed
### while => condition is true  the commands will be executed

# until [ condition ]
#     do 
#         command1
#         command1
#         ...
#         ....
#         commandN
# done
n=1

until [ $n -ge 10 ]
    do 
        echo "n = "$n
        n=$(( n+1 ))
done

n=1
until (($n > 10 )) 
    do 
        echo "n ===> "$n
        (( n++ ))
done

```

### FOR LOOP 
```
# for VARIABLE in 1 2 3 4 5 .. N
# do
#     command1
#     command2
#     command3
# done
# ### OR ----------------------------------------------

# for VARIABLE in file1 file2 file3
# do
#     command1 on $VARIABLE
#     command2
#     command3
# done
# ### OR ----------------------------------------------

# for OUTPUT in in $(Linux-Or-Unix-Command-Here)
# do
#     command1 on $OUTPUT
#     command2 on $OUTPUT
#     command3
# done
# ### OR ----------------------------------------------

# for (( EXP1; EXP2; EXP3 ))
# do
#     command1 
#     command2 
#     command3
# done

### BASH_VERSION
echo ${BASH_VERSION}

for i in 1 2 3 4 5 6 7 8 9 10
do
    echo " i  = " $i
done
###  {START..END} suported by bash v3
for i in {11..20}
do
    echo " i  = " $i
done
###  {START..END..INCREMENT} suported by bash v3
for i in {21..30..2}
do
    echo " i  = " $i
done
### using condition (( EXP1; EXP2; EXP3 ))
for (( i=40; i< 50 ; i++ ))
do
    echo " i  = " $i
done

### using $(Linux-Or-Unix-Command-Here)
### pwd ==> present working directory 
### ls ===> list 
for command in ls pwd date 
do 
    ### give the name of command 
    echo "----------- $command-----------------"
    ### execute command sequentially
    $command 
done

### print all directories which are there in your home folder 
### * iterate over each and every file or direcotry in this directory which i am currently in 
for item in * 
do 
    # -d ==> direcotry  it s a directory
    # -f ==> file  it s a file
    # $item ==> name of item 
    if [ -d $item ]
        then 
            echo "directory ===> $item" 
    elif [ -f $item ] 
        then 
            echo "file ===> $item"
    fi    
done
```

### Select LOOP 
```
### Select construct allows us to generate easy menus. so whenever you need to write a script whith require some menus , the you can select loop 
###
# select varName in list 
# do 
#     command1
#     command2
#     command3
#     ...
#     commandN
# done 

select name in Youssef Meriem Yassine Fatima  
do 
    # echo " $name selected"
    case $name  in 
        Youssef )
            echo Youssef selected 
            ;;
        Meriem )
            echo Meriem selected 
            ;;
        Yassine )
            echo Yassine selected 
            ;;
        Fatima )
            echo Fatima selected 
            ;;
        * )
            echo " no choice!"
            echo "Error please provide the n0. between 1..4"
            ;;
    esac
done 
### exit selection press ctrl+c
```

### Break and continue 
```
### we want to break out of the loop prematurely,the we can use break statement

for (( i=1 ; i<=10 ; i++))
do 
    if [ $i -gt 8 ]
        then 
            break
    elif [ $i -eq 3 -o $i -eq 6  ]
        then 
            continue  ### skip echo when i = 3 or 6
    fi
    echo " i == $i"
done 

```
### FUNCTIONS
```
# function name(){
#     commands 
# }

# name(){
#     commands 
# }

### function with arguments  $1  $2  $3
function print (){
    echo " print() arg1 ==> $1 , arg2 ==> $2 , arg3 ==> $3" 
}

function helloFn(){
    echo " Hello !" 
}

function quit(){
    ### exit => exit the script 
    exit
}

print banana
print Tomato
print Car Bus Aircraft

### execute function helloFn
helloFn 
### execute function helloFn
quit
### this echo will be not execute because quit stop script
echo "I am here "

```
### LOCAL VARIBLES 
```
### by default , every variable which you declare in your script is a global varible and it can be accessed from anywhere in your script 

function print(){
    ###  name is global varible 
    # name=$1

    # local ==> declar variable localy , scope varible only in the function , not afecte a global varibale name
    local name=$1
    echo "the name is $name"
}

# name is global variable
name=Morati
echo "The name is $name  : Before"

print Mario 

echo "The name is $name : After"
```

### FUNCTION EXEMPLE 
```
is_file_exist(){
    local file="$1"
    
    ### -f file exist or not 
    ### for the test we use ternairy operation 
    ### [[ CONDITION ]] && CHOICE1 || CHOICE2
    ### condition = 0 choice1 is selected 
    ### condition = 1 choice2 is selected 
    [[ -f "$file" ]] && return 0 || return 1
}

### ternairy operation 
### $# number of arguments 
[[ $# -eq 0 ]]

### $1 is an arguement from CLI it s different of function
if ( is_file_exist "$1" )
    then 
        echo "File found"
    else
        echo "File not found "
fi

### to test ==> ./hello.sh Readme.md
```

### READONLY  COMMAND
```
### Used to make variables or functions read only , not be overwritten

var=31

readonly var

var=50 

echo " var => $var "

helloFn() {
    echo "Hello world !"
}

helloFn

### -f => flag
readonly -f helloFn

### we can't rewrite function helloFn because it s readonly 
helloFn() {
    echo "Hello there !"
}

### show all the variables which are read only
echo "=========================="
readonly


echo "======Params/Variables===================="
### -p => parameters / variables
readonly -p

echo "======Functions===================="
### -p => functions
readonly -f

```

### SIGNALS AND TRAPS  
```
### show the pid of the script itself
# echo "pid is $$"
# while (( COUNT < 10 ))
# do 
#     sleep 10 
#     (( COUNT ++ ))
#     echo "COUNT = $COUNT"
# done
# exit 0

### ctrl+c is a signal is called the interrupt signal and in signal terms it's called SIGINT
### ctrl+z is a signal is called the suspend signal and in signal terms it's called Sig D DP
### kill -9 refId is a signal is called the kill signal and in signal terms it's called SIGKILL SIGNAL

### Trap command  provides the script to capture and Interrupt and then clean it up within the script

### help 
########  man 7 signal 

### 0 is success
### whenever we receive a signal zero , then we need to execute this kind of command 
# trap "echo Exit command is detected" 0 
# echo "Hello world"
# exit 0



# trap "echo Exit command is detected" SIGINT 
### trap can not catch SIGKILL SIGSTOP is two exception for trap 
# trap "echo Exit command is detected" SIGKILL SIGSTOP
# echo "pid is $$"
# while (( COUNT < 10 ))
# do 
#     sleep 10 
#     (( COUNT ++ ))
#     echo "COUNT = $COUNT"
# done
# exit 0



file=/usr/zaghir/file.txt
trap "rm -f $file && echo file deleted  ; exit" 0 2 15
echo "pid is $$"
while (( COUNT < 10 ))
do 
    sleep 10 
    (( COUNT ++ ))
    echo "COUNT = $COUNT"
done
exit 0

### test with  ./hello.sh 
### in other teminal execute kill -15 procesId

########### to see log of trap 
### execute in CLI trap

########### remove trap 
### trap -  ==> removing
### trap - SIGNALS
### trap  0 2 15

```

### DEBUG A BACH SCRIPT
```

```
