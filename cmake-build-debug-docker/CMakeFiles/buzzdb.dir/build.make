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
CMAKE_SOURCE_DIR = /tmp/buzzdb-snippets

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/buzzdb-snippets/cmake-build-debug-docker

# Include any dependencies generated for this target.
include CMakeFiles/buzzdb.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/buzzdb.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/buzzdb.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/buzzdb.dir/flags.make

mc_parser.tab.cc: ../mc_parser.yy
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "[BISON][mc_parser] Building parser with bison 3.8.2"
	cd /tmp/buzzdb-snippets && /usr/bin/bison -d -o /tmp/buzzdb-snippets/cmake-build-debug-docker/mc_parser.tab.cc mc_parser.yy

mc_parser.tab.hh: mc_parser.tab.cc
	@$(CMAKE_COMMAND) -E touch_nocreate mc_parser.tab.hh

mc_lexer.yy.cc: ../mc_lexer.l
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "[FLEX][mc_lexer] Building scanner with flex 2.6.4"
	cd /tmp/buzzdb-snippets && /usr/bin/flex -o/tmp/buzzdb-snippets/cmake-build-debug-docker/mc_lexer.yy.cc mc_lexer.l

CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.o: CMakeFiles/buzzdb.dir/flags.make
CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.o: ../src/rw_latches/rw_latches.cc
CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.o: CMakeFiles/buzzdb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.o -MF CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.o.d -o CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.o -c /tmp/buzzdb-snippets/src/rw_latches/rw_latches.cc

CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/buzzdb-snippets/src/rw_latches/rw_latches.cc > CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.i

CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/buzzdb-snippets/src/rw_latches/rw_latches.cc -o CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.s

CMakeFiles/buzzdb.dir/src/utils/file.cc.o: CMakeFiles/buzzdb.dir/flags.make
CMakeFiles/buzzdb.dir/src/utils/file.cc.o: ../src/utils/file.cc
CMakeFiles/buzzdb.dir/src/utils/file.cc.o: CMakeFiles/buzzdb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/buzzdb.dir/src/utils/file.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/buzzdb.dir/src/utils/file.cc.o -MF CMakeFiles/buzzdb.dir/src/utils/file.cc.o.d -o CMakeFiles/buzzdb.dir/src/utils/file.cc.o -c /tmp/buzzdb-snippets/src/utils/file.cc

CMakeFiles/buzzdb.dir/src/utils/file.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/buzzdb.dir/src/utils/file.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/buzzdb-snippets/src/utils/file.cc > CMakeFiles/buzzdb.dir/src/utils/file.cc.i

CMakeFiles/buzzdb.dir/src/utils/file.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/buzzdb.dir/src/utils/file.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/buzzdb-snippets/src/utils/file.cc -o CMakeFiles/buzzdb.dir/src/utils/file.cc.s

CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.o: CMakeFiles/buzzdb.dir/flags.make
CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.o: ../src/utils/tutorial.cc
CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.o: CMakeFiles/buzzdb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.o -MF CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.o.d -o CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.o -c /tmp/buzzdb-snippets/src/utils/tutorial.cc

CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/buzzdb-snippets/src/utils/tutorial.cc > CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.i

CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/buzzdb-snippets/src/utils/tutorial.cc -o CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.s

CMakeFiles/buzzdb.dir/mc_driver.cpp.o: CMakeFiles/buzzdb.dir/flags.make
CMakeFiles/buzzdb.dir/mc_driver.cpp.o: ../mc_driver.cpp
CMakeFiles/buzzdb.dir/mc_driver.cpp.o: CMakeFiles/buzzdb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/buzzdb.dir/mc_driver.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/buzzdb.dir/mc_driver.cpp.o -MF CMakeFiles/buzzdb.dir/mc_driver.cpp.o.d -o CMakeFiles/buzzdb.dir/mc_driver.cpp.o -c /tmp/buzzdb-snippets/mc_driver.cpp

CMakeFiles/buzzdb.dir/mc_driver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/buzzdb.dir/mc_driver.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/buzzdb-snippets/mc_driver.cpp > CMakeFiles/buzzdb.dir/mc_driver.cpp.i

CMakeFiles/buzzdb.dir/mc_driver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/buzzdb.dir/mc_driver.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/buzzdb-snippets/mc_driver.cpp -o CMakeFiles/buzzdb.dir/mc_driver.cpp.s

CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o: CMakeFiles/buzzdb.dir/flags.make
CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o: mc_lexer.yy.cc
CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o: mc_parser.tab.hh
CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o: CMakeFiles/buzzdb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o -MF CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o.d -o CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o -c /tmp/buzzdb-snippets/cmake-build-debug-docker/mc_lexer.yy.cc

CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/buzzdb-snippets/cmake-build-debug-docker/mc_lexer.yy.cc > CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.i

CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/buzzdb-snippets/cmake-build-debug-docker/mc_lexer.yy.cc -o CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.s

CMakeFiles/buzzdb.dir/mc_parser.tab.cc.o: CMakeFiles/buzzdb.dir/flags.make
CMakeFiles/buzzdb.dir/mc_parser.tab.cc.o: mc_parser.tab.cc
CMakeFiles/buzzdb.dir/mc_parser.tab.cc.o: CMakeFiles/buzzdb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/buzzdb.dir/mc_parser.tab.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/buzzdb.dir/mc_parser.tab.cc.o -MF CMakeFiles/buzzdb.dir/mc_parser.tab.cc.o.d -o CMakeFiles/buzzdb.dir/mc_parser.tab.cc.o -c /tmp/buzzdb-snippets/cmake-build-debug-docker/mc_parser.tab.cc

CMakeFiles/buzzdb.dir/mc_parser.tab.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/buzzdb.dir/mc_parser.tab.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/buzzdb-snippets/cmake-build-debug-docker/mc_parser.tab.cc > CMakeFiles/buzzdb.dir/mc_parser.tab.cc.i

CMakeFiles/buzzdb.dir/mc_parser.tab.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/buzzdb.dir/mc_parser.tab.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/buzzdb-snippets/cmake-build-debug-docker/mc_parser.tab.cc -o CMakeFiles/buzzdb.dir/mc_parser.tab.cc.s

# Object files for target buzzdb
buzzdb_OBJECTS = \
"CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.o" \
"CMakeFiles/buzzdb.dir/src/utils/file.cc.o" \
"CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.o" \
"CMakeFiles/buzzdb.dir/mc_driver.cpp.o" \
"CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o" \
"CMakeFiles/buzzdb.dir/mc_parser.tab.cc.o"

# External object files for target buzzdb
buzzdb_EXTERNAL_OBJECTS =

libbuzzdb.a: CMakeFiles/buzzdb.dir/src/rw_latches/rw_latches.cc.o
libbuzzdb.a: CMakeFiles/buzzdb.dir/src/utils/file.cc.o
libbuzzdb.a: CMakeFiles/buzzdb.dir/src/utils/tutorial.cc.o
libbuzzdb.a: CMakeFiles/buzzdb.dir/mc_driver.cpp.o
libbuzzdb.a: CMakeFiles/buzzdb.dir/mc_lexer.yy.cc.o
libbuzzdb.a: CMakeFiles/buzzdb.dir/mc_parser.tab.cc.o
libbuzzdb.a: CMakeFiles/buzzdb.dir/build.make
libbuzzdb.a: CMakeFiles/buzzdb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX static library libbuzzdb.a"
	$(CMAKE_COMMAND) -P CMakeFiles/buzzdb.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/buzzdb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/buzzdb.dir/build: libbuzzdb.a
.PHONY : CMakeFiles/buzzdb.dir/build

CMakeFiles/buzzdb.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/buzzdb.dir/cmake_clean.cmake
.PHONY : CMakeFiles/buzzdb.dir/clean

CMakeFiles/buzzdb.dir/depend: mc_lexer.yy.cc
CMakeFiles/buzzdb.dir/depend: mc_parser.tab.cc
CMakeFiles/buzzdb.dir/depend: mc_parser.tab.hh
	cd /tmp/buzzdb-snippets/cmake-build-debug-docker && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/buzzdb-snippets /tmp/buzzdb-snippets /tmp/buzzdb-snippets/cmake-build-debug-docker /tmp/buzzdb-snippets/cmake-build-debug-docker /tmp/buzzdb-snippets/cmake-build-debug-docker/CMakeFiles/buzzdb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/buzzdb.dir/depend

