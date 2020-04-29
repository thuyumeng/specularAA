#!/bin/sh
make -C /Users/yumeng/Desktop/specularAA/build/src -f /Users/yumeng/Desktop/specularAA/build/src/CMakeScripts/glfw_postBuildPhase.make$CONFIGURATION OBJDIR=$(basename "$OBJECT_FILE_DIR_normal") all
