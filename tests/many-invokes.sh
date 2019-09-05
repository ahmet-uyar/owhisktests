#!/bin/bash

# invoke one function many times

# function name to execute
# fname="hello-nj"
fname="hello-java"
tempFile="temp.txt"

# execute the function many times
for i in {0..100}
do
  ./once-invoke.sh $fname $tempFile $i &
done

echo "Started all. Exiting  ..."
