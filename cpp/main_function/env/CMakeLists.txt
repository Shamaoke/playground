
##
## ::: MainFunction | Env build management file :::
##

## Generate build files (and set the specified variables as CMake cache entries)
## with the following command.
## ````
## cmake \
##   -D MY_BUILD_TYPE_DEBUG=ON \
##   -D MY_RUNTIME_OUTPUT_DIRECTORY=$(pwd) \
##   -G Ninja \
##   -S $(pwd) \
##   -B _build
##   --fresh # (optional) Configure a fresh build tree, removing any existing cache files
##           # Details: [Looking for a 'cmake clean' command to clear up CMake output - Stack Overflow](https://stackoverflow.com/questions/9680420/looking-for-a-cmake-clean-command-to-clear-up-cmake-output).
## ````

## Build and install the project with the following command.
## `cmake --build _build --target install -- --verbose`
## The double hyphen token (`--`) is used to separate the build management tool
## options (e. g. CMake) from the build tool options (e. g. Ninja).
##

cmake_minimum_required(VERSION 3.31)

set(CMAKE_CXX_COMPILER clang++)
## This variable must be set before any language is set (i. e. before any `project()`
## or `enable_language()` command).
## Details: [FAQ · Wiki · CMake / Community · GitLab](https://gitlab.kitware.com/cmake/community/-/wikis/FAQ#how-do-i-use-a-different-compiler#user-content-method-3-avoid-use-set).
##

## set(CMAKE_CXX_STANDARD 23)

## set(CMAKE_CXX_FLAGS -std=c++23)
## This will add the specified flag both to the compiler and also to the linker
## commands if a compiler frontend is used as a linker in the linker command.
## This variable must be set before any language is set (i. e. before any `project()`
## Or
add_compile_options(-std=c++23)
## This will add the specified flag only to the compiler command.
##

set(CMAKE_LINKER_TYPE LLD)
## Set a linker.
## Details:
## [CMAKE_LINKER_TYPE — CMake 3.31.3 Documentation](https://cmake.org/cmake/help/latest/variable/CMAKE_LINKER_TYPE.html)
## Or
#  set(CMAKE_EXE_LINKER_FLAGS -fuse-ld=lld)
## Or
#  add_link_options(-fuse-ld=lld)
## Or
#  set(CMAKE_CXX_LINK_EXECUTABLE /usr/bin/ld.lld)
## [CMAKE_<LANG>_LINK_EXECUTABLE — CMake 3.31.3 Documentation](https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_LINK_EXECUTABLE.html)
##

project(cpp_arrays LANGUAGES CXX)

string(ASCII 27 ESC)
string(ASCII 91 LSB)
string(ASCII 109 FB)

set(CSI "${ESC}${LSB}")
set(RES "${CSI}0${FB}")

set(ORANGE_F "${CSI}38;5;202${FB}")
set(ORANGE_B "${CSI}48;5;202${FB}")

set(BLUE_F "${CSI}38;5;4${FB}")
set(BLUE_B "${CSI}48;5;4${FB}")
## Details: [How to make colorized message() with CMake? - Stack Overflow](https://stackoverflow.com/questions/18968979/how-to-make-colorized-message-with-cmake).

## The following variables are set after any language is set.
#  message(STATUS "${ORANGE_F}Using compiler:${RES} ${BLUE_F}${CMAKE_CXX_COMPILER_ID}${RES}")
#  message(STATUS "${ORANGE_F}Using linker:${RES} ${BLUE_F}${CMAKE_CXX_COMPILER_LINKER_ID}${RES}")

function(status KEY VALUE)
  message(STATUS "${ORANGE_F}${KEY}${RES}: ${BLUE_F}${VALUE}${RES}")
endfunction()
## Details: [function — CMake 3.31.3 Documentation](https://cmake.org/cmake/help/latest/command/function.html).

status("Using compiler" ${CMAKE_CXX_COMPILER_ID})
status("Using linker" ${CMAKE_CXX_COMPILER_LINKER_ID})

add_executable(main main.cpp)

#  target_compile_definitions(main PUBLIC "$<$<CONFIG:DEBUG>:DEBUG>")
## The `DEBUG` variable will be set when running CMake with the command
## `cmake -D CMAKE_BUILD_TYPE=Debug -G Ninja -S . -B _build`

# set(MY_BUILD_TYPE_DEBUG OFF CACHE BOOL "Set the DEBUG build type: ON/OFF")
# if(${MY_BUILD_TYPE_DEBUG})
#   target_compile_definitions(main PUBLIC DEBUG)
# endif()
##
## Or using generator expressions.
##
set(MY_BUILD_TYPE_DEBUG OFF CACHE BOOL "Set the DEBUG build type: ON/OFF")
target_compile_definitions(main PUBLIC $<$<BOOL:${MY_BUILD_TYPE_DEBUG}>:DEBUG>)
## Details: [cmake-generator-expressions(7) — CMake documentation](https://cmake.org/cmake/help/latest/manual/cmake-generator-expressions.7.html).

set(MY_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/_build" CACHE STRING "Set the RUNTIME OUTPUT DIRECTORY")
set_target_properties(
  main
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${MY_RUNTIME_OUTPUT_DIRECTORY}"
  # LINKER_TYPE
  #   LLD
)
## Use the following command-line command to change the runtime output directory to the source root.
## `cmake -D MY_RUNTIME_OUTPUT_DIRECTORY=$(pwd) -G Ninja -S . -B _build`

# set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR})

install(
  TARGETS main
  RUNTIME
    DESTINATION ${CMAKE_SOURCE_DIR}/_bin
)


# file(GLOB MY_FILES "${CMAKE_SOURCE_DIR}/_build/*")
##
## Will not work, because file list won't contain files which will be added
## AFTER generating build files.
##
# message(STATUS "${ORANGE_F}BIN${RES}: ${BLUE_F}${MY_FILES}${RES}")
#
# add_custom_target(
#   implode
#   COMMAND rm -rf ${MY_FILES}
# )

# add_custom_target(
#   implode
#   COMMAND rm -rf "${CMAKE_SOURCE_DIR}/_build/~.ninja_log(D)"
# )
## `~.filename(D)` is a Zsh globbing expression which matches all files exept
## `.filename` (`~`) while enabling globbing dotfiles (`(D)`) (by default
## globbing dotfiles is disabled).
## NOTE: shell globbing is NOT working in CMake config files. CMake uses its
## own primitive globbing format. See [file — CMake 3.31.3 Documentation](https://cmake.org/cmake/help/latest/command/file.html)
## for details.
##

