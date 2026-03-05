
##
## ::: Learn Qt | Sample 0004 :::
##

cmake_minimum_required(VERSION 4.1)

set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_CXX_STANDARD 23)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(sample-0004 VERSION 0.0.0 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Core)

set(CMAKE_AUTOMOC ON)

set(SOURCES main.cc sample.cc)

set(HEADERS sample.hh)

add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})

target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Core)

