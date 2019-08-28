#!/bin/bash
suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-java-with-data
else
  fname=hello-java-with-data-${suffix}
fi

wsk -i action create $fname hello-with-data.jar --main Hello --kind java:default --timeout 120000
