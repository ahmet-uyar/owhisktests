#!/bin/bash
suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-java-with-data
else
  fname=hello-java-with-data-${suffix}
fi

wsk -i action delete $fname
