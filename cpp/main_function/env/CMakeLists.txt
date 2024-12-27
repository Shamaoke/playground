
##
## ::: MainFunction | Env build management file :::
##

cmake_minimum_required(VERSION 3.31)

project(cpp_arrays LANGUAGES CXX)

# set(CMAKE_CXX_COMPILER /usr/bin/g++)
# set(CMAKE_CXX_STANDARD 23)

set(CMAKE_CXX_COMPILER /usr/bin/clang++)

add_compile_options(-std=c++23)

add_executable(main main.cpp)

## The `DEBUG` variable will be set when running CMake with the command
## `cmake -D CMAKE_BUILD_TYPE=Debug -G Ninja -S . -B _build`
target_compile_definitions(main PUBLIC "$<$<CONFIG:DEBUG>:DEBUG>")

# set_target_properties(
#   main
#   PROPERTIES
#     RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}
# )

