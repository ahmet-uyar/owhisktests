#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-nj-with-data
else
  fname=hello-nj-with-data-${suffix}
fi

wsk -i action create $fname --kind nodejs:10 hello-nj.zip --timeout 120000
