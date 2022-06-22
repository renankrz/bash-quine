#!/bin/bash
me=`basename "$0"`
base=${me:0:${#me}-4};
pre=${me:0:${#me}-3};
len=${#pre}
lastchar=${pre:${len}-1:1}
nextchar=$(($lastchar+1))
nextname=$base$nextchar.sh
q=27
source=(
'#!/bin/bash'
'me=`basename "$0"`'
'base=${me:0:${#me}-4};'
'pre=${me:0:${#me}-3};'
'len=${#pre}'
'lastchar=${pre:${len}-1:1}'
'nextchar=$(($lastchar+1))'
'nextname=$base$nextchar.sh'
'q=27'
'source=('
')'
'echo ${source[0]} > $nextname'
'for (( i=1; i<10; i++ ));'
'do'
'echo ${source[$i]} >> $nextname'
'done'
'for (( i=0; i<25; i++ ));'
'do'
'echo -e "\x${q}"${source[i]}"\x${q}" >> $nextname'
'done'
'for (( i=10; i<25; i++ ));'
'do'
'echo ${source[i]} >> $nextname'
'done'
'chmod 744 $nextname'
)
echo ${source[0]} > $nextname
for (( i=1; i<10; i++ ));
do
echo ${source[$i]} >> $nextname
done
for (( i=0; i<25; i++ ));
do
echo -e "\x${q}"${source[i]}"\x${q}" >> $nextname
done
for (( i=10; i<25; i++ ));
do
echo ${source[i]} >> $nextname
done
chmod 744 $nextname
