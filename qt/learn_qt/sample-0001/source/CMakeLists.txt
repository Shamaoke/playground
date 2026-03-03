
##
## ::: Learn Qt | Sample 0001 :::
##

cmake_minimum_required(VERSION 4.2)

set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(sample-0001 VERSION 0.0.0 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
# set(CMAKE_AUTORCC ON)
# set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core REQUIRED)

set(
  SOURCES
    main.cc
    counter.cc
)

set(
  HEADERS
    counter.hh
)

add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})

target_link_libraries(${PROJECT_NAME} Qt6::Core)

