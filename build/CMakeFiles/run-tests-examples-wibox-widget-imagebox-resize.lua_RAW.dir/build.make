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

# Utility rule file for run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.

# Include any custom commands dependencies for this target.
include CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/progress.make

CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW:
	/home/tobias/awesome/tests/examples/runner.sh /dev/null env -u LUA_PATH_5_1 -u LUA_PATH_5_2 -u LUA_PATH_5_3 "LUA_PATH=/home/tobias/awesome/tests/examples/shims/?.lua;/home/tobias/awesome/tests/examples/shims/?/init.lua;/home/tobias/awesome/tests/examples/shims/?;/home/tobias/awesome/lib/?.lua;/home/tobias/awesome/lib/?/init.lua;/home/tobias/awesome/lib/?;/home/tobias/awesome/themes/?.lua;/home/tobias/awesome/themes/?;/home/tobias/awesome/tests/examples/?.lua;/usr/local/share/lua/5.2/?.lua;/usr/local/share/lua/5.2/?/init.lua;/usr/local/lib/lua/5.2/?.lua;/usr/local/lib/lua/5.2/?/init.lua;/usr/share/lua/5.2/?.lua;/usr/share/lua/5.2/?/init.lua;./?.lua" AWESOME_THEMES_PATH=/home/tobias/awesome/themes/ SOURCE_DIRECTORY=/home/tobias/awesome /usr/bin/lua /home/tobias/awesome/tests/examples/wibox/template.lua /home/tobias/awesome/tests/examples/wibox/widget/imagebox/resize.lua /home/tobias/awesome/build/raw_images/AUTOGEN_wibox_widget_imagebox_resize

run-tests-examples-wibox-widget-imagebox-resize.lua_RAW: CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW
run-tests-examples-wibox-widget-imagebox-resize.lua_RAW: CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/build.make
.PHONY : run-tests-examples-wibox-widget-imagebox-resize.lua_RAW

# Rule to build all files generated by this target.
CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/build: run-tests-examples-wibox-widget-imagebox-resize.lua_RAW
.PHONY : CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/build

CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/cmake_clean.cmake
.PHONY : CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/clean

CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/depend:
	cd /home/tobias/awesome/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tobias/awesome /home/tobias/awesome /home/tobias/awesome/build /home/tobias/awesome/build /home/tobias/awesome/build/CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/run-tests-examples-wibox-widget-imagebox-resize.lua_RAW.dir/depend

