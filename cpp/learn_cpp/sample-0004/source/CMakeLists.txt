
##
## ::: Learn C++ | Sample 0004 :::
##

##
## Use the following command to generate build files.
##
## ````
## cmake \
##   -DCMAKE_BUILD_TYPE=Debug \
##   -B . \
##   -S ../source
## ````
##
## Use the following command to build the project.
##
## ````
## cmake --build .
## ````
##
## Use the following command to clean the build directory.
##
## ````
## cmake --build . --target clean
## ````
##

cmake_minimum_required(VERSION 4.2)

set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(sample-0004 VERSION 0.0.0 LANGUAGES CXX)

set(
  SOURCES
    main.cpp
)

add_executable(sample-0004 ${SOURCES})

