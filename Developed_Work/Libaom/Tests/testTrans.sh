#!/bin/bash

./regenc.sh -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/ducks_take_off_420_720p50.y4m -r 2 -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/ducks_regular.webm -q 60 -l 10

/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/ducks_regular.webm --i420 -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/ducks_regular.y4m

./regenc.sh -e /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/NewTrans/aomenc -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/ducks_take_off_420_720p50.y4m -r 2 -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/ducks_newDCT.webm -q 60 -l 10

/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Builds/Regular/aomdec /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/ducks_newDCT.webm --i420 -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/TransTests/ducks_newDCT8.y4m