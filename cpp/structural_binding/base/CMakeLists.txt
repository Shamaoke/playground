
##
## ::: <title> | <subtitle> build management file :::
##

cmake_minimum_required(VERSION 3.31)

# set(CMAKE_CXX_COMPILER /usr/bin/g++)
# set(CMAKE_CXX_STANDARD 23)

set(CMAKE_CXX_COMPILER clang++)

add_compile_options(-std=c++23)

add_link_options(-fuse-ld=lld)

project(title_subtitle LANGUAGES CXX)

add_executable(main main.cpp)

set_target_properties(
  main
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/_/bin
)

