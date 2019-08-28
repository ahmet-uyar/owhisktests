#!/bin/bash
suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-java
else
  fname=hello-java-${suffix}
fi

wsk -i action create $fname hello.jar --main Hello --kind java:default --timeout 120000
