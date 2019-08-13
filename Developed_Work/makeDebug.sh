#!/bin/bash

#AOM file path
aompath="$1"

#Destination folder path
#buildpath="$2"

cmake "$aompath" -DCMAKE_BUILD_TYPE=Debug -DAOM_TARGET_CPU=generic -DCONFIG_MULTITHREAD=0
make
