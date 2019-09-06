#!/bin/bash

# this does not measure the timing for copying files correctly
# because copy returns immediately wihout waiting its completion

file=numbers-1.dat
storage=ssd

source=${HOME}/owhisktests/fatfunctions/functions/randomdata/
target="/scratch_${storage}/tmp/"

start=$(date +%s%3N)
cp ${source}${file} ${target}
end=$(date +%s%3N)
delay=$((end-start))
echo "${storage} delay: $delay"
echo "${storage} delay: $delay" >> copy-delays.txt
