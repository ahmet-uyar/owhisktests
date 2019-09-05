#!/bin/bash

# output filename
fname="hello-nj-with-data"
outFile=${PWD}/"fat-nj-test.txt"
type="ssd"

cd ${HOME}/openwhisk/ansible

for i in {0..4}
do
  # clean and redeploy openwhisk to initialize the system
  ./clean.sh
  ./deploy.sh

  echo "Deployed OpenWhisk. Waiting 30 seconds just to make sure that every thing gets ready ...."
  sleep 30

  # execute the function
  start=$(date +%s%3N)
  wsk -i action invoke --result $fname --param name Jack
  end=$(date +%s%3N)
  delay=$((end-start))
  echo "$type $fname $delay $start $end" >> $outFile
  echo "$type $fname $delay"
done
