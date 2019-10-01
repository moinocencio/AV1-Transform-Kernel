#!/bin/bash

frames=10

## CIF: waterfall
./testenccosbits.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/waterfall -l $frames
./gettransstats.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/waterfall_stats

## CIF: flower
./testenccosbits.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/flower_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/flower -l $frames
./gettransstats.sh -r 1 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/flower_cif.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/flower_stats

## HD: mobcal
./testenccosbits.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_mobcal_ter.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/mobcal -l $frames
./gettransstats.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_mobcal_ter.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/mobcal_stats

## HD: Ducks
./testenccosbits.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/ducks_take_off_420_720p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/ducks -l $frames
./gettransstats.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/ducks_take_off_420_720p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/ducks_stats

## HD: Sintel
./testenccosbits.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/sintel_trailer_2k_720p24.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/sintel -l $frames
./gettransstats.sh -r 2 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/sintel_trailer_2k_720p24.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/sintel_stats

## FHD: Dinner
./testenccosbits.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/dinner_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/dinner -l $frames
./gettransstats.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/dinner_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/dinner_stats

## FHD: Factory
./testenccosbits.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/factory_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/factory -l $frames
./gettransstats.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/factory_1080p30.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/factory_stats

## FHD: Park Joy
./testenccosbits.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/park_joy_1080p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/parkjoy -l $frames
./gettransstats.sh -r 3 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/park_joy_1080p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/parkjoy_stats

## UHD: Old town Cross
./testenccosbits.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/old_town_cross_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/oldtowncross -l $frames
./gettransstats.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/old_town_cross_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/oldtowncross_stats

## UHD: Into tree
./testenccosbits.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/in_to_tree_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/intotree -l $frames
./gettransstats.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/in_to_tree_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/intotree_stats

## UHD: Crowd Run
./testenccosbits.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/crowd_run_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/crowdrun -l $frames
./gettransstats.sh -r 4 -i /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/crowd_run_2160p50.y4m -o /run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/crowdrun_stats