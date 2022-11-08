#! /bin/bash
# Prints random lines from file
AMOUNT=$1
FILENAME=$2
LINES=`wc -l $FILENAME | cut -d ' ' -f1`

NUMBER=`expr $LINES \/ 100 \* $AMOUNT`

for ((i=0;i<$NUMBER;i++));
    do
        OUTPUT=$(($RANDOM % $LINES))
        echo `head -$OUTPUT $FILENAME | tail -1`
    done