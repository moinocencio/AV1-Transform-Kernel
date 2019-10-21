#!/bin/bash

# Test AV1 vs My Transforms

# Choose options
transenc=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/NewTrans/aomenc
inpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_parkrun_ter.y4m
res=2
outpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/parkrun
limit=10
qual=26

usage="$(basename "$0") [-h] [-e path] [-i path] [-r n] [-l n] [-q n] [-o path] -- test transform stages

    -h  display help text
    -e  experimental encoder path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/NewTrans/aomenc)
    -i  input video path (default Developed_Work/Libaom/Test_Videos/HD/720p50_parkrun_ter.y4m)
    -r  resolutions:    1 - CIF 352x288 
                        2 - HD 720x1280 (default)
                        3 - FHD 1080x1920
                        4 - UHD 2160x3840                            
                        5 - UHD 2160x4096   
    -l  number of frames to encode (10 default)
    -q  quality level 0 (best) to 63 (worst) (default 26)
    -o  output path (default Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/parkrun)"                       

while getopts ':he:i:r:l:q:o:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    e) transenc=$OPTARG
       ;;
    r) res=$OPTARG
       ;;
    i) inpath=$OPTARG
       ;;
    o) outpath=$OPTARG
       ;;
    l) limit=$OPTARG
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

echo -e "\n\e[1m\e[31mRegular Transform Encoding\e[0m"
./regenc.sh -i $inpath -r $res -o $outpath"_reg_trans.webm" -q $qual -l $limit
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec $outpath"_reg_trans.webm" --i420 -o $outpath"_reg_trans.y4m"

echo -e "\n\e[1m\e[32mExperimental Transform Encoding\e[0m"
./regenc.sh -e $transenc -i $inpath -r $res -o $outpath"_exp_trans.webm" -q $qual -l $limit
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec $outpath"_exp_trans.webm" --i420 -o $outpath"_exp_trans.y4m"