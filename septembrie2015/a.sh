#!/bin/sh

rm tmp
echo -n > tmp

for f in $*
do
  if test ! -f $f # linia 5
    then
    echo $f nu exista ca fisier
    continue
  fi
  rm $f
  if [ ! -f $f ] # linia 11
    then
    echo $f a fost sters cu succes
  fi
  ls $f >> tmp
done

x=`cat tmp | grep -c ^.*$` # linia 17
echo rezultat: $x
