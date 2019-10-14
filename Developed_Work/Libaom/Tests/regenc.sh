#!/bin/bash

# Make regular encode

# Choose options
encpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomenc
res="-h 288 -w 352"
inpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m
outpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/waterfall_test.webm
limit="--limit=26"
qual=26

usage="$(basename "$0") [-h] [-e path] [-i path] [-r n] [-l n] [-q n] [-o path] -- default encoding tests

    -h  display help text
    -e  encoder path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomenc)
    -i  input video path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m)
    -r  resolutions:    1 - CIF 352x288 (default)
                        2 - HD 720x1280
                        3 - FHD 1080x1920
                        4 - UHD 2160x3840                            
                        5 - UHD 2160x4096   
    -l  number of frames to encode (20 default)
    -q  quality level 0 (best) to 63 (worst) (default 26)
    -o  output path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/waterfall_test.webm)"                       

while getopts ':he:i:r:l:q:o:' option; do
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
    i) inpath=$OPTARG
       ;;
    o) outpath=$OPTARG
       ;;
    l) limit="--limit=$OPTARG"
       ;;
    q) qual=$OPTARG
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

"$encpath" "$inpath" $res -o "$outpath" "$limit" -p 1 --cpu-used=8 --i420 --q-hist=64 --end-usage=q --cq-level="$qual"