#!/bin/bash

dirs="dotnet go java nodejs php python ruby swift"

for i in {1..10}
do
  for dir in $dirs
  do
    cd $dir
    ./delete.sh $i
    cd ..
  done
done
