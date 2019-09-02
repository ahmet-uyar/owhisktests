#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-php
else
  fname=hello-php-${suffix}
fi

wsk -i action create $fname hello.php --kind php:default --timeout 120000
