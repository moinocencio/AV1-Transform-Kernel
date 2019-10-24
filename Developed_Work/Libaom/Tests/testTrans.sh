#!/bin/bash

# Test AV1 vs My Transforms

# Choose options
transencmult=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/NewTransMult/aomenc
transencshift=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/NewTransShift/aomenc
transencbuttmult=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/NewTransButtMult/aomenc
inpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_parkrun_ter.y4m
res=2
outpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/parkrun
limit=10
qual=26

usage="$(basename "$0") -- test transform stages

    -h  display help text
    -m  multiplier encoder path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/NewTransMult/aomenc)
    -s  shift encoder path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/NewTransShift/aomenc)
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
    m) transencmult=$OPTARG
       ;;
    s) transencshift=$OPTARG
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

echo -e "\n\e[1m\e[32mMultiplier Transform Encoding\e[0m"
./regenc.sh -e $transencmult -i $inpath -r $res -o $outpath"_mult_trans.webm" -q $qual -l $limit
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec $outpath"_mult_trans.webm" --i420 -o $outpath"_mult_trans.y4m"

echo -e "\n\e[1m\e[33mShift Transform Encoding\e[0m"
./regenc.sh -e $transencshift -i $inpath -r $res -o $outpath"_shift_trans.webm" -q $qual -l $limit
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec $outpath"_shift_trans.webm" --i420 -o $outpath"_shift_trans.y4m"

echo -e "\n\e[1m\e[34mButterfly Multiplication Transform Encoding\e[0m"
./regenc.sh -e $transencbuttmult -i $inpath -r $res -o $outpath"_buttmult_trans.webm" -q $qual -l $limit
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec $outpath"_buttmult_trans.webm" --i420 -o $outpath"_buttmult_trans.y4m"