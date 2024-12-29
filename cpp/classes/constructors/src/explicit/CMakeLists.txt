
##
## ::: Classes | Constructors | Explicit library build managemet file :::
##

add_library(explicit libexplicit.cpp)

target_include_directories(
  explicit
  PUBLIC ${CMAKE_SOURCE_DIR}/include
)

