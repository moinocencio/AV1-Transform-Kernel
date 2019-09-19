#!/bin/bash

res=1
inpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m
outpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/waterfall
limit=100

usage="$(basename "$0") [-h] [-r n] [-v path] [-o path] [-l n] -- encode video with different cosine representations

    -h  display help text    
    -r  resolutions:    1 - CIF 288x352 (default)
                        2 - FHD 1080x1920
    -v  input video path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m)                        
    -o  output path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/waterfalldec)
    -l  number of frames to encode (100 default)"                    

while getopts ':hr:v:o:l:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    r) res=$OPTARG
       ;;
    v) inpath=$OPTARG
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

#Regular encode/decode
echo "Regular Encode/Decode"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomenc -r $res -v $inpath -o $outpath"_reg_enc.webm" -l $limit

/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec $outpath"_reg_enc.webm" --i420 -o $outpath"_reg_dec.y4m"


#10bit encode/decode
echo "10bit Cosine Encode/Decode"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit10/aomenc -r $res -v $inpath -o $outpath"_10b_enc.webm" -l $limit

/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit10/aomdec $outpath"_10b_enc.webm" --i420 -o $outpath"_10b_dec.y4m"


#16bit encode/decode
echo "16bit Cosine Encode/Decode"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit16/aomenc -r $res -v $inpath -o $outpath"_16b_enc.webm" -l $limit

/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit16/aomdec $outpath"_16b_enc.webm" --i420 -o $outpath"_16b_dec.y4m"


#Retrieve Global Stats
echo "Retrieve Global Stats"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/PrintStats/aomenc -r $res -v $inpath -o $outpath"_reg_enc.webm" -l $limit