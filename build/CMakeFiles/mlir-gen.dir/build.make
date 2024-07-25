# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/leon/tutorial/mlir-tutorial/mlir-toy

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/leon/tutorial/mlir-tutorial/mlir-toy/build

# Include any dependencies generated for this target.
include CMakeFiles/mlir-gen.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/mlir-gen.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mlir-gen.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mlir-gen.dir/flags.make

CMakeFiles/mlir-gen.dir/gen.cpp.o: CMakeFiles/mlir-gen.dir/flags.make
CMakeFiles/mlir-gen.dir/gen.cpp.o: ../gen.cpp
CMakeFiles/mlir-gen.dir/gen.cpp.o: CMakeFiles/mlir-gen.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/leon/tutorial/mlir-tutorial/mlir-toy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/mlir-gen.dir/gen.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/mlir-gen.dir/gen.cpp.o -MF CMakeFiles/mlir-gen.dir/gen.cpp.o.d -o CMakeFiles/mlir-gen.dir/gen.cpp.o -c /home/leon/tutorial/mlir-tutorial/mlir-toy/gen.cpp

CMakeFiles/mlir-gen.dir/gen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mlir-gen.dir/gen.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/leon/tutorial/mlir-tutorial/mlir-toy/gen.cpp > CMakeFiles/mlir-gen.dir/gen.cpp.i

CMakeFiles/mlir-gen.dir/gen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mlir-gen.dir/gen.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/leon/tutorial/mlir-tutorial/mlir-toy/gen.cpp -o CMakeFiles/mlir-gen.dir/gen.cpp.s

# Object files for target mlir-gen
mlir__gen_OBJECTS = \
"CMakeFiles/mlir-gen.dir/gen.cpp.o"

# External object files for target mlir-gen
mlir__gen_EXTERNAL_OBJECTS =

bin/mlir-gen: CMakeFiles/mlir-gen.dir/gen.cpp.o
bin/mlir-gen: CMakeFiles/mlir-gen.dir/build.make
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRParser.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRFuncDialect.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRArithDialect.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRBytecodeReader.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRAsmParser.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRCallInterfaces.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRControlFlowInterfaces.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRFunctionInterfaces.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRSideEffectInterfaces.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRInferTypeOpInterface.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRCastInterfaces.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRDialect.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRInferIntRangeCommon.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRInferIntRangeInterface.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRUBDialect.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRIR.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libMLIRSupport.so.20.0git
bin/mlir-gen: /home/leon/tutorial/mlir-tutorial/install/lib/libLLVMSupport.so.20.0git
bin/mlir-gen: CMakeFiles/mlir-gen.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/leon/tutorial/mlir-tutorial/mlir-toy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/mlir-gen"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mlir-gen.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mlir-gen.dir/build: bin/mlir-gen
.PHONY : CMakeFiles/mlir-gen.dir/build

CMakeFiles/mlir-gen.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mlir-gen.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mlir-gen.dir/clean

CMakeFiles/mlir-gen.dir/depend:
	cd /home/leon/tutorial/mlir-tutorial/mlir-toy/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/leon/tutorial/mlir-tutorial/mlir-toy /home/leon/tutorial/mlir-tutorial/mlir-toy /home/leon/tutorial/mlir-tutorial/mlir-toy/build /home/leon/tutorial/mlir-tutorial/mlir-toy/build /home/leon/tutorial/mlir-tutorial/mlir-toy/build/CMakeFiles/mlir-gen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mlir-gen.dir/depend
