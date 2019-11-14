connect -url tcp:127.0.0.1:3121
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4 210274504943A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4 210274504943A"} -index 0
dow /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.sdk/DCTTimingTest/Debug/DCTTimingTest.elf
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4 210274504943A"} -index 0
con
