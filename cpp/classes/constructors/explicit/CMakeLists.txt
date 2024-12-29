
##
## ::: Classes | Constructors | Explicit build management file :::
##

add_executable(main main.cpp)

set_target_properties(
  main
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/_bin
)

target_link_libraries(
  main
  PRIVATE explicit
)

