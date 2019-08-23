#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-nj
else
  fname=hello-nj-${suffix}
fi

wsk -i action delete $fname
