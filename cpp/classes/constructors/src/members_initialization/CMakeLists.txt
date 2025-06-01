
##
## ::: Classes | Constructors | Explicit library build managemet file :::
##

add_library(members_initialization libmembers_initialization.cpp)

target_include_directories(
  members_initialization
  PUBLIC ${CMAKE_SOURCE_DIR}/include
)

