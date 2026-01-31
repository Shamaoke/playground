
##
## ::: Learn C++ | Sample 0001 :::
##

cmake_minimum_required(VERSION 4.2)

set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(sample-0002 VERSION 0.0.0 LANGUAGES CXX)

set(
  SOURCES
    main.cpp
)

add_executable(sample-0002 ${SOURCES})

