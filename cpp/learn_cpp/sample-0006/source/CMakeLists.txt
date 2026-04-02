
##
## ::: Learn C++ | Sample 0006 :::
##

cmake_minimum_required(VERSION 4.1)

set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fcolor-diagnostics")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(sample-0006 VERSION 0.0.0 LANGUAGES CXX)

set(SOURCES main.cc)

add_executable(${PROJECT_NAME} ${SOURCES})

