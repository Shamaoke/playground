
##
## ::: Learn Qt | Sample 0001 :::
##

##
## Prepare the project with the following command:
##
## ````
## cmake \
##   --fresh \
##   -DCMAKE_TOOLCHAIN_FILE=~/.local/share/vcpkg/scripts/buildsystems/vcpkg.cmake \
##   -DCMAKE_BUILD_TYPE=Debug \
##   -G Ninja \
##   -B . \
##   -S ../source
## ````
##
## Build the project with the following command:
##
## ````
## cmake --build .
## ````
##

cmake_minimum_required(VERSION 4.1)

set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_CXX_STANDARD 23)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(sample-0001 VERSION 0.0.0 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Core)

##
## Use one of the two following commands to generate Qt-specific MOC files
## from Qt-flavoured C++ files.
##
## The following command should be called after `find_package(Qt6 REQUIRED COMPONENTS Core)`.
## qt_standard_project_setup( )
##
set(CMAKE_AUTOMOC ON)

set(SOURCES main.cc sample.cc)

set(HEADERS sample.hh)

if(CMAKE_GENERATOR MATCHES "Ninja")
  message(STATUS "Using Ninja build system")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fcolor-diagnostics")
endif( )

add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})

target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Core)

