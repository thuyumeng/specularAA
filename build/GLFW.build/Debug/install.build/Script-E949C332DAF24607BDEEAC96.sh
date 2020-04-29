#!/bin/sh
make -C /Users/yumeng/Desktop/specularAA/build -f /Users/yumeng/Desktop/specularAA/build/CMakeScripts/install_postBuildPhase.make$CONFIGURATION OBJDIR=$(basename "$OBJECT_FILE_DIR_normal") all
