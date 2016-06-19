#!/bin/sh

SUM=0

for A in $*; do
  N=`echo $A | grep "^[0-9]$"`
  if [ "$N" != "" ]; then
    SUM=`expr $SUM + $N`
  fi
done

echo $SUM
