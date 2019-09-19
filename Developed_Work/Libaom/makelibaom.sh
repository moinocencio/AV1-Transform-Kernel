#!/bin/bash

# AOM file path
aompath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/libaom

# Cmake args switch
makes=1

usage="$(basename "$0") [-h] [-m n] [-p path] -- build libaom into current folder

    -h  display help text
    -m  build type:     1 - Regular Generic CPU (default)
                        2 - Debug
                        3 - Regular
    -p  libaom path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/libaom)"                       

while getopts ':hm:p:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    m) makes=$OPTARG
       ;;
    p) aompath=$OPTARG
       ;;
    :) printf "missing argument for -${OPTARG}\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;   
   \?) printf "illegal option: \n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift "$((OPTIND - 1))"

case "$makes" in
    "1" )   # Regular
        cmake "$aompath" -DAOM_TARGET_CPU=generic
        ;;
    "2" )
        cmake "$aompath" -DCMAKE_BUILD_TYPE=Debug -DAOM_TARGET_CPU=generic -DCONFIG_MULTITHREAD=0
        ;;
    "3" )
        cmake
        ;;
    *   )
        printf "invalid argument\n"
        echo "$usage"
        exit 1
        ;;
esac

make
