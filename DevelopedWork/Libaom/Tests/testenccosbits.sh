#!/bin/bash

res=1
inpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m
outpath=/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/waterfall
limit=20

usage="$(basename "$0") [-h] [-r n] [-i path] [-o path] [-l n] -- encode video with different cosine representations and quality objectives

    -h  display help text    
    -r  resolutions:    1 - CIF 288x352 (default)
                        2 - HD 720x1280
                        3 - FHD 1080x1920
                        4 - UHD 2160x3840
                        5 - UHD 2160x4096
    -i  input video path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m)                        
    -o  output path (default /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/waterfalldec)
    -l  number of frames to encode (20 default)"                    

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

echo -e "\n\e[1m\e[31mEncoding Test: $inpath\n\e[1m\e[34mHigh Quality Encode\n\e[39mRegular Encode/Decode\e[0m\n" | tee -a /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/TestCosBitLog.txt
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomenc -r $res -i $inpath -o $outpath"_q5_reg_enc.webm" -l $limit -q 5 2>&1 | tee -a /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/TestCosBitLog.txt
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec $outpath"_q5_reg_enc.webm" --i420 -o $outpath"_q5_reg_dec.y4m"

echo -e "\n\e[1m10bit Encode/Decode\e[0m\n"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit10/aomenc -r $res -i $inpath -o $outpath"_q5_10b_enc.webm" -l $limit -q 5
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit10/aomdec $outpath"_q5_10b_enc.webm" --i420 -o $outpath"_q5_10b_dec.y4m"

echo -e "\n\e[1m16bit Encode/Decode\e[0m\n"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit16/aomenc -r $res -i $inpath -o $outpath"_q5_16b_enc.webm" -l $limit -q 5
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit16/aomdec $outpath"_q5_16b_enc.webm" --i420 -o $outpath"_q5_16b_dec.y4m"

##############
echo -e "\n\e[1m\e[32mLow Quality Encode\n\e[39mRegular Encode/Decode\e[0m\n" | tee -a /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/TestCosBitLog.txt
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomenc -r $res -i $inpath -o $outpath"_q60_reg_enc.webm" -l $limit -q 60 2>&1 | tee -a /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/TestCosBitLog.txt
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec $outpath"_q60_reg_enc.webm" --i420 -o $outpath"_q60_reg_dec.y4m"

echo -e "\n\e[1m10bit Encode/Decode\e[0m\n"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit10/aomenc -r $res -i $inpath -o $outpath"_q60_10b_enc.webm" -l $limit -q 60
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit10/aomdec $outpath"_q60_10b_enc.webm" --i420 -o $outpath"_q60_10b_dec.y4m"

echo -e "\n\e[1m16bit Encode/Decode\e[0m\n"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit16/aomenc -r $res -i $inpath -o $outpath"_q60_16b_enc.webm" -l $limit -q 60
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit16/aomdec $outpath"_q60_16b_enc.webm" --i420 -o $outpath"_q60_16b_dec.y4m"

##############
echo -e "\n\e[1m\e[33mMedium Quality Encode\n\e[39mRegular Encode/Decode\e[0m\n" | tee -a /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/TestCosBitLog.txt
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomenc -r $res -i $inpath -o $outpath"_q25_reg_enc.webm" -l $limit -q 25 2>&1 | tee -a /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/TestCosBitLog.txt
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec $outpath"_q25_reg_enc.webm" --i420 -o $outpath"_q25_reg_dec.y4m"

echo -e "\n\e[1m10bit Encode/Decode\e[0m\n"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit10/aomenc -r $res -i $inpath -o $outpath"_q25_10b_enc.webm" -l $limit -q 25
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit10/aomdec $outpath"_q25_10b_enc.webm" --i420 -o $outpath"_q25_10b_dec.y4m"

echo -e "\n\e[1m16bit Encode/Decode\e[0m\n"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit16/aomenc -r $res -i $inpath -o $outpath"_q25_16b_enc.webm" -l $limit -q 25
/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Cosbit16/aomdec $outpath"_q25_16b_enc.webm" --i420 -o $outpath"_q25_16b_dec.y4m"