#!/bin/bash

frames=10

## Encode
## CIF: waterfall
./testenccosbits.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/waterfall -l $frames

## CIF: flower
./testenccosbits.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/flower_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/flower -l $frames

## CIF: bridge
./testenccosbits.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/bridge_close_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/bridge -l $frames

## HD: parkrun
./testenccosbits.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_parkrun_ter.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/parkrun -l $frames

## HD: Ducks
./testenccosbits.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/ducks_take_off_420_720p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/ducks -l $frames

## HD: Shields
./testenccosbits.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_shields_ter.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/shields -l $frames

## FHD: Dinner
./testenccosbits.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/dinner_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/dinner -l $frames

## FHD: Factory
./testenccosbits.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/factory_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/factory -l $frames

## FHD: Park Joy
./testenccosbits.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/park_joy_1080p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/parkjoy -l $frames

## UHD: Old town Cross
./testenccosbits.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/old_town_cross_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/oldtowncross -l $frames

## UHD: Into tree
./testenccosbits.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/in_to_tree_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/intotree -l $frames

## UHD: Crowd Run
./testenccosbits.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/crowd_run_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/crowdrun -l $frames

## Stats
./gettransstats.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/waterfall_stats

./gettransstats.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/flower_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/flower_stats

./gettransstats.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/bridge_close_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/bridge_stats

./gettransstats.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_parkrun_ter.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/parkrun_stats

./gettransstats.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/ducks_take_off_420_720p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/ducks_stats

./gettransstats.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_shields_ter.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/shields_stats

./gettransstats.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/dinner_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/dinner_stats

./gettransstats.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/factory_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/factory_stats

./gettransstats.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/park_joy_1080p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/parkjoy_stats

./gettransstats.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/old_town_cross_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/oldtowncross_stats

./gettransstats.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/in_to_tree_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/intotree_stats

./gettransstats.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/crowd_run_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/crowdrun_stats
