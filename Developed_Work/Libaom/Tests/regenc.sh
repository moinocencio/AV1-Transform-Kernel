#!/bin/bash

# Make regular encode

# Choose options
encpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomenc
res="-h 288 -w 352"
inpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m
outpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/waterfall_test.webm
limit="--limit=100"

usage="$(basename "$0") [-h] [-e path] [-r n] [-v path] [-o path] [-l n] -- default encoding tests

    -h  display help text
    -e  encoder path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomenc)
    -r  resolutions:    1 - CIF 352x288 (default)
                        2 - HD 720x1280
                        3 - FHD 1080x1920
                        4 - UHD 2160x4096
    -v  input video path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m)                        
    -o  output path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/waterfall_test.webm)
    -l  number of frames to encode (100 default)"                       

while getopts ':he:r:v:o:l:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    e) encpath=$OPTARG
       ;;
    r) case $OPTARG in
            "1" )
                res="-h 288 -w 352"
                ;;
            "2" )
                res="-h 720 -w 1280"
                ;;
            "3" )
                res="-h 1080 -w 1920"
                ;;
            "4" )
                res="-h 2160 -w 3840"
                ;;
            "5" )
                res="-h 2160 -w 4096"
                ;;
            *   )
                printf "invalid argument\n"
                echo "$usage"
                exit 1
                ;;
        esac
       ;;
    v) inpath=$OPTARG
       ;;
    o) outpath=$OPTARG
       ;;
    l) limit="--limit=$OPTARG"
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

"$encpath" "$inpath" $res -o "$outpath" "$limit" -p 1 --cpu-used=8 --i420