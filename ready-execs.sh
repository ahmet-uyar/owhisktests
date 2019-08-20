#!/bin/bash

# output filename
outFile="ready-out-ssd.txt"
fnames="hello-nj hello-ruby hello-php hello-py hello-java hello-dotnet hello-go hello-swift"

for fname in $fnames
do
  # send a request to ready the container
  echo "Starting container for the function: $fname"
  wsk -i action invoke --result $fname --param name Jack
  sleep 10

  for i in {0..4}
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
  echo "Finished executing function $fname ..."
done
