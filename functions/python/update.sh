#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-py
else
  fname=hello-py-${suffix}
fi

wsk -i action update $fname  --timeout 120000
