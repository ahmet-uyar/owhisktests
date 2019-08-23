#!/bin/bash

# invoke many functions one times
functions="hello-nj hello-ruby hello-php hello-py hello-java hello-dotnet hello-go hello-swift"

outFilePrefix=${PWD}/"cold-many-ssd"
testDir=${PWD}

ansDir=${HOME}/openwhisk/ansible

# for functionsPerLang in 1 2 4 8; do
for functionsPerLang in 6 8; do

  # clean and redeploy openwhisk to initialize the system
  cd $ansDir
  ./clean.sh
  ./deploy.sh
  cd $testDir

  # sleep 30 seconds to wait openwhisk be ready. not sure, whether this is necessary
  echo "Wating 30 seconds after openwhisk initilized....."
  sleep 30

  totalInvokeCount=$((functionsPerLang*8))

  # output filename
  outFile="${outFilePrefix}-${totalInvokeCount}.txt"

  # delete the output file if it exists
  if test -f "$outFile"; then
    rm $outFile
  fi

  # execute the functions for the first time to maka containers ready
  for ((i=1; i <= $functionsPerLang; i++)); do
    for fname in $functions; do
      ./once-invoke.sh ${fname}-${i} $outFile $i &
    done
  done

  # create the output file
  touch $outFile

  completed=$(wc -l < "$outFile")
  while [ $completed -ne $totalInvokeCount ]; do
    echo "waiting all to compete ..."
    sleep 1
    completed=$(wc -l < "$outFile")
  done
done

echo "All completed."
