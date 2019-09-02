#!/bin/bash
suffix=$1
fname=fat-java

# chek whether suffix is provided from command line, if it is not null
if [ -n "$suffix" ]; then
  fname=${fname}-${suffix}
fi

wsk -i action create $fname fat.jar --main Hello --kind java:default --timeout 120000
