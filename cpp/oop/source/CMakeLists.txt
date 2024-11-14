
##
## ::: OOP | Build Control File :::
##

cmake_minimum_required(VERSION 3.27)

project(bagel VERSION 0.0.0 LANGUAGES CXX)

set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS OFF)

# set(CMAKE_CXX_COMPILER /usr/bin/g++)
# set(CMAKE_CXX_STANDARD 23)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ../bin)

set(
  SOURCES
    main.cpp
)

add_executable(bagel ${SOURCES})

