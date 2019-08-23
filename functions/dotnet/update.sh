#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-dotnet
else
  fname=hello-dotnet-${suffix}
fi

wsk -i action update $fname --timeout 120000
