
##
## ::: Classes | Constructors build management file :::
##

cmake_minimum_required(VERSION 3.31)

set(CMAKE_CXX_COMPILER clang++)

add_compile_options(-std=c++23)

add_link_options(-fuse-ld=lld)

project(classes_constructors LANGUAGES CXX)

add_subdirectory(src/explicit)
add_subdirectory(explicit)
add_subdirectory(src/members_initialization)
add_subdirectory(members_initialization)

