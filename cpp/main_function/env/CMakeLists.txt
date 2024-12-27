
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

set_target_properties(
  main
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}
)

