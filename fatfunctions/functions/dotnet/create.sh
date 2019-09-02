#!/bin/bash

suffix=$1
fname=fat-dotnet

# chek whether suffix is provided from command line, if it is not null
if [ -n "$suffix" ]; then
  fname=${fname}-${suffix}
fi

wsk -i action create $fname fat-dotnet.zip --main Apache.OpenWhisk.Example.Dotnet::Apache.OpenWhisk.Example.Dotnet.Hello::Main --kind dotnet:default --timeout 120000
