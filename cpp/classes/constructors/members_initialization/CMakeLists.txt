
##
## ::: Classes | Constructors | Members initialization build management file :::
##

add_executable(members_initialization_main members_initialization.cpp)

set_target_properties(
  members_initialization_main
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/_bin
)

target_link_libraries(
  members_initialization_main
  PRIVATE members_initialization
)

