#!/bin/bash

# Restart OpenWhisk server between consecutive function tests
bindir=${HOME}/openwhisk/bin/
funcdir=${HOME}/owhisktests/functions/

# output filename
outFile=${HOME}/owhisktests/cold-out-2.txt
fnames="hello-nj hello-ruby hello-php hello-py hello-java hello-dotnet hello-go hello-swift"

for i in {0..4}
do
  # Start the server and create functions
  echo "Starting OpenWhisk server ...."
  cd $bindir && ./run.sh && sleep 10
  cd $funcdir && ./create-all.sh && sleep 5

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

  ## kill OpenWhisk server, wait 5 seconds, restart it, wait 5 seconds, create functions
  echo "Killing OpenWhisk server ..."
  cd $bindir && ./kill.sh && sleep 10
done
