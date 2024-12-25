
cmake_minimum_required(VERSION 3.31)

project(base LANGUAGES CXX)

find_package(GTest)

set(
  HEADERS
    main.hpp
)

set(
  SOURCES
    main.cpp
)

add_executable(base ${HEADERS} ${SOURCES})

set(
  SOURCES_TEST
    main_test.cpp
)

add_executable(base_test ${HEADERS} ${SOURCES_TEST})

target_link_libraries(
  base_test
  PRIVATE GTest::gtest
)

