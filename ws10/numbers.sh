#! /bin/bash
# Prints min, max, and average of 9th column of the Amazon reviews file

FILENAME=amazon_reviews_us_Books_v1_02.tsv

LINES=`wc -l $FILENAME | cut -d ' ' -f1`
MIN=`head -2 $FILENAME | tail -1 | cut -f9`
MAX=`head -2 $FILENAME | tail -1 | cut -f9`
SUM=0

for ((i=2;i<2500;i++));
    do
        NUM=`head -$i $FILENAME | tail -1 | cut -f9`
        if [ $NUM -lt $MIN ];
        then
            MIN=$NUM
        fi
        if [ $NUM -gt $MAX ];
        then
            MAX=$NUM
        fi
        SUM=`expr $SUM + $NUM`
    done


AVERAGE=`echo "scale=2; $SUM/2500" | bc`
echo $AVERAGE $MIN $MAX