
##
## ::: Basic example of using the GTest testing and mocking framework :::
##

##
## How build and run tests
## -----------------------
## 1. Run `cmake -G Ninja -S . -B _build` from CMAKE_SOURCE_DIR. The commad will
##    generate the build files and the test configuration file `CTestTestfile.cmake`
##    in the `${CMAKE_SOURCE_DIR}/_build` directory;
##
## 2. Run `cmake --build _build`. The command will build the executable `base_test`
##    in the `${CMAKE_SOURCE_DIR}/bin/test` directory;
##
## 3a. Run `ctest --test-dir _build` to run the tests. Use the `-V|--verbose` and
##     `-VV|--extra-verbose` to get more verbose output, specifically the GTest output.
##
##     Note, that the PASS/FAIL criterion of a test is purely the exit code of the test command.
##
## 3b. Alternatively, run the tests directly through the `./bin/test/base_test` command.
##

cmake_minimum_required(VERSION 3.31)

project(gtest_base LANGUAGES CXX)

# option(BUILD_TESTING "Build the testing executables" OFF)

include(CTest)
## This command will create the `BUILD_TESTING` variable and set it to `ON`.
## It also adds the `enable_testing()` command which will create `CTestTestfile.cmake`
## in the `${CMAKE_SOURCE_DIR}/_build` directory. If it's not needed to generate
## test executables one should either turn off the BUILD_TESTING option from the command
## line — `cmake -D BUILD_TESTING=OFF -G Ninja -S . -B _build`, or add the
## `option(BUILD_TESTING "..." OFF)` command to `CMakeLists.txt` before the `include(CTest)`.
##
## Details
## -------
## [BUILD_TESTING — CMake 3.31.20241224-g537e471 Documentation](https://cmake.org/cmake/help/git-stage/variable/BUILD_TESTING.html)
##

if(BUILD_TESTING)

  find_package(GTest)

  set(
    SOURCES
      base_test.cpp
      main_test.cpp
  )

  add_executable(base_test ${SOURCES})

  set_target_properties(
    base_test
    PROPERTIES
      RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/test
  )

  target_link_libraries(base_test PRIVATE GTest::gtest)

  ##
  ## The following commands are needed when running tests using the `ctest` utility.
  ## They are unnecessary, when running tests directly by the `./bin/test/base_test` command.
  ##

  ## This command will generate the `CTestTestfile.cmake` in the `${CMAKE_SOURCE_DIR}/_build` directory.
  ## It is automatically executed when including CTest module by the command `include(CTest)`.
  ##
  ## Details
  ## -------
  ## [enable_testing — CMake 3.31.3 Documentation](https://cmake.org/cmake/help/latest/command/enable_testing.html)
  ##
  # enable_testing()

  ## This command will add a test to the `CTestTestfile.cmake` test configuration file.
  add_test(
    NAME BaseTest
    COMMAND base_test --gtest_color=yes # or use GTEST_COLOR=1 when running `ctest`
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/test
  )
endif()

