#!/bin/bash

#Input file path
filename="$1"

#Run AOMAnalyzer
/media/moinocencio/Data/Tese/Software/Analyzer/AOMAnalyzer-linux-x64/AOMAnalyzer /media/moinocencio/Data/Tese/Software/Builds/aom_emscripten_build/examples/inspect.js "$filename"
