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
include addons/acodec/CMakeFiles/allegro_acodec.dir/depend.make

# Include the progress variables for this target.
include addons/acodec/CMakeFiles/allegro_acodec.dir/progress.make

# Include the compile flags for this target's objects.
include addons/acodec/CMakeFiles/allegro_acodec.dir/flags.make

addons/acodec/CMakeFiles/allegro_acodec.dir/acodec.c.o: addons/acodec/CMakeFiles/allegro_acodec.dir/flags.make
addons/acodec/CMakeFiles/allegro_acodec.dir/acodec.c.o: ../addons/acodec/acodec.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bartosz/Arko/allegro-5.2.7.0/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object addons/acodec/CMakeFiles/allegro_acodec.dir/acodec.c.o"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/allegro_acodec.dir/acodec.c.o   -c /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/acodec.c

addons/acodec/CMakeFiles/allegro_acodec.dir/acodec.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/allegro_acodec.dir/acodec.c.i"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/acodec.c > CMakeFiles/allegro_acodec.dir/acodec.c.i

addons/acodec/CMakeFiles/allegro_acodec.dir/acodec.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/allegro_acodec.dir/acodec.c.s"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/acodec.c -o CMakeFiles/allegro_acodec.dir/acodec.c.s

addons/acodec/CMakeFiles/allegro_acodec.dir/wav.c.o: addons/acodec/CMakeFiles/allegro_acodec.dir/flags.make
addons/acodec/CMakeFiles/allegro_acodec.dir/wav.c.o: ../addons/acodec/wav.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bartosz/Arko/allegro-5.2.7.0/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object addons/acodec/CMakeFiles/allegro_acodec.dir/wav.c.o"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/allegro_acodec.dir/wav.c.o   -c /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/wav.c

addons/acodec/CMakeFiles/allegro_acodec.dir/wav.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/allegro_acodec.dir/wav.c.i"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/wav.c > CMakeFiles/allegro_acodec.dir/wav.c.i

addons/acodec/CMakeFiles/allegro_acodec.dir/wav.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/allegro_acodec.dir/wav.c.s"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/wav.c -o CMakeFiles/allegro_acodec.dir/wav.c.s

addons/acodec/CMakeFiles/allegro_acodec.dir/helper.c.o: addons/acodec/CMakeFiles/allegro_acodec.dir/flags.make
addons/acodec/CMakeFiles/allegro_acodec.dir/helper.c.o: ../addons/acodec/helper.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bartosz/Arko/allegro-5.2.7.0/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object addons/acodec/CMakeFiles/allegro_acodec.dir/helper.c.o"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/allegro_acodec.dir/helper.c.o   -c /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/helper.c

addons/acodec/CMakeFiles/allegro_acodec.dir/helper.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/allegro_acodec.dir/helper.c.i"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/helper.c > CMakeFiles/allegro_acodec.dir/helper.c.i

addons/acodec/CMakeFiles/allegro_acodec.dir/helper.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/allegro_acodec.dir/helper.c.s"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/helper.c -o CMakeFiles/allegro_acodec.dir/helper.c.s

addons/acodec/CMakeFiles/allegro_acodec.dir/voc.c.o: addons/acodec/CMakeFiles/allegro_acodec.dir/flags.make
addons/acodec/CMakeFiles/allegro_acodec.dir/voc.c.o: ../addons/acodec/voc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bartosz/Arko/allegro-5.2.7.0/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object addons/acodec/CMakeFiles/allegro_acodec.dir/voc.c.o"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/allegro_acodec.dir/voc.c.o   -c /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/voc.c

addons/acodec/CMakeFiles/allegro_acodec.dir/voc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/allegro_acodec.dir/voc.c.i"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/voc.c > CMakeFiles/allegro_acodec.dir/voc.c.i

addons/acodec/CMakeFiles/allegro_acodec.dir/voc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/allegro_acodec.dir/voc.c.s"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec/voc.c -o CMakeFiles/allegro_acodec.dir/voc.c.s

# Object files for target allegro_acodec
allegro_acodec_OBJECTS = \
"CMakeFiles/allegro_acodec.dir/acodec.c.o" \
"CMakeFiles/allegro_acodec.dir/wav.c.o" \
"CMakeFiles/allegro_acodec.dir/helper.c.o" \
"CMakeFiles/allegro_acodec.dir/voc.c.o"

# External object files for target allegro_acodec
allegro_acodec_EXTERNAL_OBJECTS =

lib/liballegro_acodec.so.5.2.7: addons/acodec/CMakeFiles/allegro_acodec.dir/acodec.c.o
lib/liballegro_acodec.so.5.2.7: addons/acodec/CMakeFiles/allegro_acodec.dir/wav.c.o
lib/liballegro_acodec.so.5.2.7: addons/acodec/CMakeFiles/allegro_acodec.dir/helper.c.o
lib/liballegro_acodec.so.5.2.7: addons/acodec/CMakeFiles/allegro_acodec.dir/voc.c.o
lib/liballegro_acodec.so.5.2.7: addons/acodec/CMakeFiles/allegro_acodec.dir/build.make
lib/liballegro_acodec.so.5.2.7: lib/liballegro_audio.so.5.2.7
lib/liballegro_acodec.so.5.2.7: lib/liballegro.so.5.2.7
lib/liballegro_acodec.so.5.2.7: /usr/lib/x86_64-linux-gnu/libSM.so
lib/liballegro_acodec.so.5.2.7: /usr/lib/x86_64-linux-gnu/libICE.so
lib/liballegro_acodec.so.5.2.7: /usr/lib/x86_64-linux-gnu/libX11.so
lib/liballegro_acodec.so.5.2.7: /usr/lib/x86_64-linux-gnu/libXext.so
lib/liballegro_acodec.so.5.2.7: /usr/lib/x86_64-linux-gnu/libXcursor.so
lib/liballegro_acodec.so.5.2.7: /usr/lib/x86_64-linux-gnu/libOpenGL.so
lib/liballegro_acodec.so.5.2.7: /usr/lib/x86_64-linux-gnu/libGLU.so
lib/liballegro_acodec.so.5.2.7: /usr/lib/x86_64-linux-gnu/libGLX.so
lib/liballegro_acodec.so.5.2.7: addons/acodec/CMakeFiles/allegro_acodec.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bartosz/Arko/allegro-5.2.7.0/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C shared library ../../lib/liballegro_acodec.so"
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/allegro_acodec.dir/link.txt --verbose=$(VERBOSE)
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/liballegro_acodec.so.5.2.7 ../../lib/liballegro_acodec.so.5.2 ../../lib/liballegro_acodec.so

lib/liballegro_acodec.so.5.2: lib/liballegro_acodec.so.5.2.7
	@$(CMAKE_COMMAND) -E touch_nocreate lib/liballegro_acodec.so.5.2

lib/liballegro_acodec.so: lib/liballegro_acodec.so.5.2.7
	@$(CMAKE_COMMAND) -E touch_nocreate lib/liballegro_acodec.so

# Rule to build all files generated by this target.
addons/acodec/CMakeFiles/allegro_acodec.dir/build: lib/liballegro_acodec.so

.PHONY : addons/acodec/CMakeFiles/allegro_acodec.dir/build

addons/acodec/CMakeFiles/allegro_acodec.dir/clean:
	cd /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec && $(CMAKE_COMMAND) -P CMakeFiles/allegro_acodec.dir/cmake_clean.cmake
.PHONY : addons/acodec/CMakeFiles/allegro_acodec.dir/clean

addons/acodec/CMakeFiles/allegro_acodec.dir/depend:
	cd /home/bartosz/Arko/allegro-5.2.7.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bartosz/Arko/allegro-5.2.7.0 /home/bartosz/Arko/allegro-5.2.7.0/addons/acodec /home/bartosz/Arko/allegro-5.2.7.0/build /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec /home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec/CMakeFiles/allegro_acodec.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : addons/acodec/CMakeFiles/allegro_acodec.dir/depend

