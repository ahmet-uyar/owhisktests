#!/bin/bash

dirs="dotnet go java nodejs php python ruby swift"

for dir in $dirs
do
  cd $dir
  ./create.sh
  cd ..
done

