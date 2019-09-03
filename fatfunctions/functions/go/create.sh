#!/bin/bash

suffix=$1
fname=fat-go

# chek whether suffix is provided from command line, if it is not null
if [ -n "$suffix" ]; then
  fname=${fname}-${suffix}
fi

wsk -i action create $fname fat-go.zip --kind go:default --timeout 120000
