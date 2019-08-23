#!/bin/bash

# output filename
fname=$1
outFile=$2
index=$3

# execute the function
start=$(date +%s%3N)
wsk -i action invoke --result $fname --param name Jack
end=$(date +%s%3N)
delay=$((end-start))
echo "$index $fname $delay $start $end" >> $outFile
echo "$index $fname $delay"
