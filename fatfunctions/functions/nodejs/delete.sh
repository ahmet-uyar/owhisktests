#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-nj-with-data
else
  fname=hello-nj-with-data-${suffix}
fi

wsk -i action delete $fname
