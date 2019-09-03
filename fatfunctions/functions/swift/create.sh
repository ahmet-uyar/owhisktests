#!/bin/bash

suffix=$1
fname=fat-swift

# chek whether suffix is provided from command line, if it is not null
if [ -n "$suffix" ]; then
  fname=${fname}-${suffix}
fi

wsk -i action create $fname fat-swift.zip --kind swift:default --timeout 120000
