#!/bin/bash

suffix=$1
fname=fat-ruby

# chek whether suffix is provided from command line, if it is not null
if [ -n "$suffix" ]; then
  fname=${fname}-${suffix}
fi

wsk -i action create $fname fat-ruby.zip --kind ruby:default --timeout 120000
