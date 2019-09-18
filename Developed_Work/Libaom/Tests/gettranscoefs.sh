#!/bin/bash

# Get Input and Output coefficients 

# Choose res
res="$1"

case "$res" in
    "1" )       # Waterfall
        /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Test/aomenc /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m -h 352 -w 288  -o waterfall.webm -p 1 --cpu-used=8

        ;;
    * )       # FHD
        ;;
esac