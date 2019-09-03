#!/bin/bash

suffix=$1
fname=fat-py

# chek whether suffix is provided from command line, if it is not null
if [ -n "$suffix" ]; then
  fname=${fname}-${suffix}
fi

wsk -i action create $fname fat-py.zip --kind python:3 --timeout 120000
