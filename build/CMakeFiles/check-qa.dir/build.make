# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

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
CMAKE_SOURCE_DIR = /home/tobias/awesome

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tobias/awesome/build

# Utility rule file for check-qa.

# Include any custom commands dependencies for this target.
include CMakeFiles/check-qa.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/check-qa.dir/progress.make

CMakeFiles/check-qa:

check-qa: CMakeFiles/check-qa
check-qa: CMakeFiles/check-qa.dir/build.make
.PHONY : check-qa

# Rule to build all files generated by this target.
CMakeFiles/check-qa.dir/build: check-qa
.PHONY : CMakeFiles/check-qa.dir/build

CMakeFiles/check-qa.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/check-qa.dir/cmake_clean.cmake
.PHONY : CMakeFiles/check-qa.dir/clean

CMakeFiles/check-qa.dir/depend:
	cd /home/tobias/awesome/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tobias/awesome /home/tobias/awesome /home/tobias/awesome/build /home/tobias/awesome/build /home/tobias/awesome/build/CMakeFiles/check-qa.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/check-qa.dir/depend
