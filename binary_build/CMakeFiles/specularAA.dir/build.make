# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/yumeng/Desktop/specularAA

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/yumeng/Desktop/specularAA/binary_build

# Include any dependencies generated for this target.
include CMakeFiles/specularAA.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/specularAA.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/specularAA.dir/flags.make

CMakeFiles/specularAA.dir/specularAA.cpp.o: CMakeFiles/specularAA.dir/flags.make
CMakeFiles/specularAA.dir/specularAA.cpp.o: ../specularAA.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yumeng/Desktop/specularAA/binary_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/specularAA.dir/specularAA.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/specularAA.dir/specularAA.cpp.o -c /Users/yumeng/Desktop/specularAA/specularAA.cpp

CMakeFiles/specularAA.dir/specularAA.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/specularAA.dir/specularAA.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yumeng/Desktop/specularAA/specularAA.cpp > CMakeFiles/specularAA.dir/specularAA.cpp.i

CMakeFiles/specularAA.dir/specularAA.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/specularAA.dir/specularAA.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yumeng/Desktop/specularAA/specularAA.cpp -o CMakeFiles/specularAA.dir/specularAA.cpp.s

CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.o: CMakeFiles/specularAA.dir/flags.make
CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.o: ../glfw/deps/glad_gl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yumeng/Desktop/specularAA/binary_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.o   -c /Users/yumeng/Desktop/specularAA/glfw/deps/glad_gl.c

CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yumeng/Desktop/specularAA/glfw/deps/glad_gl.c > CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.i

CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yumeng/Desktop/specularAA/glfw/deps/glad_gl.c -o CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.s

CMakeFiles/specularAA.dir/graphics/shader.cpp.o: CMakeFiles/specularAA.dir/flags.make
CMakeFiles/specularAA.dir/graphics/shader.cpp.o: ../graphics/shader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yumeng/Desktop/specularAA/binary_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/specularAA.dir/graphics/shader.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/specularAA.dir/graphics/shader.cpp.o -c /Users/yumeng/Desktop/specularAA/graphics/shader.cpp

CMakeFiles/specularAA.dir/graphics/shader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/specularAA.dir/graphics/shader.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yumeng/Desktop/specularAA/graphics/shader.cpp > CMakeFiles/specularAA.dir/graphics/shader.cpp.i

CMakeFiles/specularAA.dir/graphics/shader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/specularAA.dir/graphics/shader.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yumeng/Desktop/specularAA/graphics/shader.cpp -o CMakeFiles/specularAA.dir/graphics/shader.cpp.s

# Object files for target specularAA
specularAA_OBJECTS = \
"CMakeFiles/specularAA.dir/specularAA.cpp.o" \
"CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.o" \
"CMakeFiles/specularAA.dir/graphics/shader.cpp.o"

# External object files for target specularAA
specularAA_EXTERNAL_OBJECTS =

specularAA: CMakeFiles/specularAA.dir/specularAA.cpp.o
specularAA: CMakeFiles/specularAA.dir/glfw/deps/glad_gl.c.o
specularAA: CMakeFiles/specularAA.dir/graphics/shader.cpp.o
specularAA: CMakeFiles/specularAA.dir/build.make
specularAA: glfw/src/libglfw.3.3.dylib
specularAA: CMakeFiles/specularAA.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/yumeng/Desktop/specularAA/binary_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable specularAA"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/specularAA.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/specularAA.dir/build: specularAA

.PHONY : CMakeFiles/specularAA.dir/build

CMakeFiles/specularAA.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/specularAA.dir/cmake_clean.cmake
.PHONY : CMakeFiles/specularAA.dir/clean

CMakeFiles/specularAA.dir/depend:
	cd /Users/yumeng/Desktop/specularAA/binary_build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yumeng/Desktop/specularAA /Users/yumeng/Desktop/specularAA /Users/yumeng/Desktop/specularAA/binary_build /Users/yumeng/Desktop/specularAA/binary_build /Users/yumeng/Desktop/specularAA/binary_build/CMakeFiles/specularAA.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/specularAA.dir/depend

