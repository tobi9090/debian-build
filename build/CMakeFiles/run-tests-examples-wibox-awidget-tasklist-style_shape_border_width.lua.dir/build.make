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

# Utility rule file for run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.

# Include any custom commands dependencies for this target.
include CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/progress.make

CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua: /home/tobias/awesome/tests/examples/_postprocess.lua
	/home/tobias/awesome/tests/examples/_postprocess.lua /home/tobias/awesome/build/raw_images/AUTOGEN_wibox_awidget_tasklist_style_shape_border_width.svg /home/tobias/awesome/build/doc/images/AUTOGEN_wibox_awidget_tasklist_style_shape_border_width.svg

run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua: CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua
run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua: CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/build.make
.PHONY : run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua

# Rule to build all files generated by this target.
CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/build: run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua
.PHONY : CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/build

CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/cmake_clean.cmake
.PHONY : CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/clean

CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/depend:
	cd /home/tobias/awesome/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tobias/awesome /home/tobias/awesome /home/tobias/awesome/build /home/tobias/awesome/build /home/tobias/awesome/build/CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/run-tests-examples-wibox-awidget-tasklist-style_shape_border_width.lua.dir/depend

