#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-ruby
else
  fname=hello-ruby-${suffix}
fi

wsk -i action create $fname hello.rb --kind ruby:default --timeout 120000
