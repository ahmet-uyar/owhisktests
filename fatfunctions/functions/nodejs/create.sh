#!/bin/bash

suffix=$1
fname=fat-nj

# chek whether suffix is provided from command line, if it is not null
if [ -n "$suffix" ]; then
  fname=${fname}-${suffix}
fi

wsk -i action create $fname --kind nodejs:10 fat-nj.zip --timeout 120000
