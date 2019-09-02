#!/bin/bash

outFile=${PWD}/"cold-out-hdd.txt"
fnames="hello-nj hello-ruby hello-php hello-py hello-java hello-dotnet hello-go hello-swift"

cd ${HOME}/openwhisk/ansible

# sleep duration in seconds between consecutive function tests
# sleep 11 minutes. Containers deleted after 10 minutes.
# sleepDur=$((12*60))

for i in {0..4}
do
  # clean and redeploy openwhisk to initialize the system
  ./clean.sh
  ./deploy.sh

  echo "Deployed OpenWhisk. Waiting 30 seconds just to make sure that every thing gets ready ...."
  sleep 30

  # query openwhisk for each function
  for fname in $fnames
  do
    start=$(date +%s%3N)
    wsk -i action invoke --result $fname --param name Jack
    end=$(date +%s%3N)
    delay=$((end-start))
    echo "$fname $delay" >> $outFile
    echo "Executed $fname Sleeping 5 seconds before the next query..."
    sleep 5
  done

  echo "---------------" >> $outFile
  echo "Executed iteration $i ........................................."
#  echo "Executed iteration $i Sleeping for $sleepDur seconds ........................................"
#  sleep $sleepDur

done
