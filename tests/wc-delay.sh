#!/bin/bash

# count the lines in the file.
# we want to actually measure file reading time
# when counting lines, this should read whole file 

file=data.txt
storage=hdd

dir="/scratch_${storage}/tmp/"

start=$(date +%s%3N)
wc -l ${dir}${file}
end=$(date +%s%3N)
delay=$((end-start))
echo "${storage} delay: $delay"
echo "${storage} delay: $delay" >> wc-delays.txt

