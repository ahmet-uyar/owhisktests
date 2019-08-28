#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-go
else
  fname=hello-go-${suffix}
fi

wsk -i action create $fname hello.go --kind go:default --timeout 120000
