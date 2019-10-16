#!/bin/bash
./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/NewTrans/aomenc -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/waterfall_newDCT8.webm -q 5 -l 10

/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/waterfall_newDCT8.webm --i420 -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/waterfall_newDCT8.y4m

./regenc.sh -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/waterfall_regular.webm -q 5 -l 10

/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/waterfall_regular.webm --i420 -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/waterfall_regular.y4m