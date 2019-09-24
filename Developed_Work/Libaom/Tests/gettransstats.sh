#!/bin/bash

#CIF encode/decode
echo "CIF Stats"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/PrintStats/aomenc -r 1 -v /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m -o Enc_DecVideos/waterfallStats.webm -l 10

mv TransformStats.txt Encode_Stats/TransformStats_waterfall.txt

#HD encode/decode
echo "HD Stats"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/PrintStats/aomenc -r 2 -v /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/ducks_take_off_420_720p50.y4m -o Enc_DecVideos/StatsTemp.webm -l 10

mv TransformStats.txt Encode_Stats/TransformStats_ducks.txt

#FHD encode/decode
echo "FHD Stats"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/PrintStats/aomenc -r 3 -v /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/park_joy_1080p50.y4m -o Enc_DecVideos/StatsTemp.webm -l 10

mv TransformStats.txt Encode_Stats/TransformStats_park1080.txt

#UHD encode/decode
echo "FHD Stats"
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/PrintStats/aomenc -r 4 -v /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/Netflix_Crosswalk_4096x2160_60fps_10bit_420.y4m -o Enc_DecVideos/StatsTemp.webm -l 10

mv TransformStats.txt Encode_Stats/TransformStats_crosswalk.txt