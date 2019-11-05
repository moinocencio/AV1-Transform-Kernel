#!/bin/bash

frames=1

## Encode
## CIF: waterfall
./testTrans.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/waterfall_ttest -l $frames

## CIF: flower
./testTrans.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/flower_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/flower_ttest -l $frames

## CIF: bridge
./testTrans.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/bridge_close_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/bridge_ttest -l $frames

## HD: parkrun
./testTrans.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_parkrun_ter.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/parkrun_ttest -l $frames

## HD: Ducks
./testTrans.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/ducks_take_off_420_720p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/ducks_ttest -l $frames

## HD: Shields
./testTrans.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_shields_ter.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/shields_ttest -l $frames

## FHD: Dinner
./testTrans.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/dinner_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/dinner_ttest -l $frames

## FHD: Factory
./testTrans.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/factory_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/factory_ttest -l $frames

## FHD: Park Joy
./testTrans.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/park_joy_1080p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/parkjoy_ttest -l $frames

## UHD: Old town Cross
./testTrans.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/old_town_cross_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/oldtowncross_ttest -l $frames

## UHD: Into tree
./testTrans.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/in_to_tree_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/intotree_ttest -l $frames

## UHD: Crowd Run
./testTrans.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/crowd_run_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/crowdrun_ttest -l $frames

