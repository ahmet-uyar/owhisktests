#!/bin/bash

# OpenWhisk standalone keeps only 4 containers running
# So there is no need for waiting 12 minutes between consecutive runs for containers to be deleted
# Latest 4 containers are kept alive, others deleted

# output filename
outFile="warm-out-ssd.txt"
fnames="hello-nj hello-ruby hello-php hello-py hello-java hello-dotnet hello-go hello-swift"

# sleep duration in seconds between consecutive function tests
# sleep 12 minutes. Containers deleted after 10 minutes.
# sleepDur=$((12*60))

for i in {0..4}
do
  # query openwhisk for each function
  for fname in $fnames
  do
    start=$(date +%s%3N)
    wsk -i action invoke --result $fname --param name Jack
    end=$(date +%s%3N)
    delay=$((end-start))
    echo "$fname $delay" >> $outFile
    echo "Executed $fname Sleeping 10 seconds before the next query..."
    sleep 10
  done

  echo "---------------" >> $outFile
  echo "Executed iteration $i ..."
#   echo "Executed iteration $i Sleeping for $sleepDur seconds ..."
#   sleep $sleepDur

done
