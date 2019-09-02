#!/bin/bash
suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-java
else
  fname=hello-java-${suffix}
fi

wsk -i action delete $fname
