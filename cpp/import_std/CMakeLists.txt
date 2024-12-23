
##
## ::: import std build management file :::
##

##
## Details
## -------
## [import std in CMake 3.30](https://www.kitware.com/import-std-in-cmake-3-30/)
##

##
## NOTE As of 23.12.2024, the build file generation by the command `cmake -G Ninja -S . -B build`
## fails with the following.
##
## ````
## CMake Error in CMakeLists.txt:
##   The "CXX_MODULE_STD" property on the target "uses_std" requires that the
##   "__CMAKE::CXX23" target exist, but it was not provided by the toolchain.
##   Reason:
##
##     Toolchain does not support discovering `import std` support
##
## ````
##

cmake_minimum_required(VERSION 3.31)

set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD "0e5b6991-d74f-4b3d-a41c-cf096e0b2508")

project(import_std LANGUAGES CXX)

set(CMAKE_CXX_MODULE_STD ON)

add_library(uses_std STATIC)

target_sources(uses_std PRIVATE uses_std.cpp)

target_compile_features(
  uses_std
  PRIVATE cxx_std_23
  INTERFACE cxx_std_20
)

add_executable(main)

target_sources(main PRIVATE main.cpp)

target_link_libraries(main PRIVATE uses_std)

