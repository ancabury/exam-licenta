#!/bin/sh

echo $#: $*

p=`echo $1 | grep ^[^0-9]*[0-9]$` #L2
if [ "$p" != "" ]
then
  shift
  ./s.sh $*
fi
