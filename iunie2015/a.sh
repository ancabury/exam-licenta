#!/bin/bash

M=0
N=0
for F in *.log; do
  A=`grep "\<ERROR\>" $F | wc -l`
  M=`expr $M + $A`
  B=`grep "\<ERROR\>.*\<segmentation fault\>" $F | wc -l` #L8
  N=`expr $N + $B`
done

echo "$N $M"
expr 100 \* $N / $M #L11
