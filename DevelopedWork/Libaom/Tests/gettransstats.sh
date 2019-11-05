#!/bin/bash

res=1
inpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m
outpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/waterfall_stats
limit=4

usage="$(basename "$0") [-h] [-r n] [-i path] [-o path] [-l n] -- Get Transform Coefficients between different quality encodings

    -h  display help text    
    -r  resolutions:    1 - CIF 288x352 (default)
                        2 - HD 720x1280
                        3 - FHD 1080x1920
                        4 - UHD 2160x3840
                        5 - UHD 2160x4096
    -i  input video path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m)                        
    -o  output path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/waterfall_stats)
    -l  number of frames to encode (5 default)"                    

while getopts ':hr:i:o:l:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    r) res=$OPTARG
       ;;
    i) inpath=$OPTARG
       ;;
    o) outpath=$OPTARG
       ;;
    l) limit=$OPTARG
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

echo -e "\n\e[1m\e[31mEncoding Stats Test: $inpath\n\e[1m\e[34mHigh Quality Encode\e[0m\n"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/PrintStats/aomenc -r $res -i $inpath -o ./tempv.webm -l $limit -q 5
mv TransformStats.txt $outpath"_q5.txt"

echo -e "\n\e[1m\e[32mLow Quality Encode\e[0m\n"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/PrintStats/aomenc -r $res -i $inpath -o ./tempv.webm -l $limit -q 60
mv TransformStats.txt $outpath"_q60.txt"

echo -e "\n\e[1m\e[33mMedium Quality Encode\e[0m\n"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/PrintStats/aomenc -r $res -i $inpath -o ./tempv.webm -l $limit -q 25
mv TransformStats.txt $outpath"_q25.txt"
rm tempv.webm