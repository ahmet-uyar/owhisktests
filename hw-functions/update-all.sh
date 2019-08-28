#!/bin/bash

dirs="dotnet go java nodejs php python ruby swift"

for i in {1..10}
do
  for dir in $dirs
  do
    cd $dir
    ./update.sh $i
    cd ..
  done
done
