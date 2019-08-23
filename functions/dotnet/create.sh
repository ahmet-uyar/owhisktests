#!/bin/bash

suffix=$1
# chek whether suffix is provided from command line
if [ "$suffix" = "" ]; then
  fname=hello-dotnet
else
  fname=hello-dotnet-${suffix}
fi

wsk -i action create $fname helloDotNet.zip --main Apache.OpenWhisk.Example.Dotnet::Apache.OpenWhisk.Example.Dotnet.Hello::Main --kind dotnet:default --timeout 120000
