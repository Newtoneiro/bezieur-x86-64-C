# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bartosz/Arko/allegro-5.2.7.0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bartosz/Arko/allegro-5.2.7.0/build

# Include any dependencies generated for this target.
include examples/CMakeFiles/ex_vsync.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/ex_vsync.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/ex_vsync.dir/flags.make

examples/CMakeFiles/ex_vsync.dir/ex_vsync.c.o: examples/CMakeFiles/ex_vsync.dir/flags.make
examples/CMakeFiles/ex_vsync.dir/ex_vsync.c.o: ../examples/ex_vsync.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bartosz/Arko/allegro-5.2.7.0/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/CMakeFiles/ex_vsync.dir/ex_vsync.c.o"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ex_vsync.dir/ex_vsync.c.o   -c /home/bartosz/Arko/allegro-5.2.7.0/examples/ex_vsync.c

examples/CMakeFiles/ex_vsync.dir/ex_vsync.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ex_vsync.dir/ex_vsync.c.i"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/bartosz/Arko/allegro-5.2.7.0/examples/ex_vsync.c > CMakeFiles/ex_vsync.dir/ex_vsync.c.i

examples/CMakeFiles/ex_vsync.dir/ex_vsync.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ex_vsync.dir/ex_vsync.c.s"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/bartosz/Arko/allegro-5.2.7.0/examples/ex_vsync.c -o CMakeFiles/ex_vsync.dir/ex_vsync.c.s

# Object files for target ex_vsync
ex_vsync_OBJECTS = \
"CMakeFiles/ex_vsync.dir/ex_vsync.c.o"

# External object files for target ex_vsync
ex_vsync_EXTERNAL_OBJECTS =

examples/ex_vsync: examples/CMakeFiles/ex_vsync.dir/ex_vsync.c.o
examples/ex_vsync: examples/CMakeFiles/ex_vsync.dir/build.make
examples/ex_vsync: lib/liballegro_main.so.5.2.7
examples/ex_vsync: lib/liballegro_font.so.5.2.7
examples/ex_vsync: lib/liballegro_image.so.5.2.7
examples/ex_vsync: lib/liballegro_primitives.so.5.2.7
examples/ex_vsync: lib/liballegro.so.5.2.7
examples/ex_vsync: /usr/lib/x86_64-linux-gnu/libSM.so
examples/ex_vsync: /usr/lib/x86_64-linux-gnu/libICE.so
examples/ex_vsync: /usr/lib/x86_64-linux-gnu/libX11.so
examples/ex_vsync: /usr/lib/x86_64-linux-gnu/libXext.so
examples/ex_vsync: /usr/lib/x86_64-linux-gnu/libXcursor.so
examples/ex_vsync: /usr/lib/x86_64-linux-gnu/libOpenGL.so
examples/ex_vsync: /usr/lib/x86_64-linux-gnu/libGLU.so
examples/ex_vsync: /usr/lib/x86_64-linux-gnu/libGLX.so
examples/ex_vsync: examples/CMakeFiles/ex_vsync.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bartosz/Arko/allegro-5.2.7.0/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ex_vsync"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ex_vsync.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/ex_vsync.dir/build: examples/ex_vsync

.PHONY : examples/CMakeFiles/ex_vsync.dir/build

examples/CMakeFiles/ex_vsync.dir/clean:
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/ex_vsync.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/ex_vsync.dir/clean

examples/CMakeFiles/ex_vsync.dir/depend:
	cd /home/bartosz/Arko/allegro-5.2.7.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bartosz/Arko/allegro-5.2.7.0 /home/bartosz/Arko/allegro-5.2.7.0/examples /home/bartosz/Arko/allegro-5.2.7.0/build /home/bartosz/Arko/allegro-5.2.7.0/build/examples /home/bartosz/Arko/allegro-5.2.7.0/build/examples/CMakeFiles/ex_vsync.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/ex_vsync.dir/depend

