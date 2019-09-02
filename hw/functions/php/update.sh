#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-php
else
  fname=hello-php-${suffix}
fi

wsk -i action update $fname --timeout 120000
