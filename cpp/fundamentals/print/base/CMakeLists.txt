
##
## ::: Print | Base build management file :::
##

cmake_minimum_required(VERSION 3.31)

# set(CMAKE_CXX_COMPILER /usr/bin/g++)
# set(CMAKE_CXX_STANDARD 23)

set(CMAKE_CXX_COMPILER clang++)

add_compile_options(-std=c++23)

add_link_options(-fuse-ld=lld)

project(print_base LANGUAGES CXX)

##
## Создавать файл `compile_commands.json` в каталоге сборки, содержащий перечень
## вызовов компилятора для всех единиц трансляции. Файл может быть использован
## в системах автодополнения текстовых редакторов исходного кода.
##
## ВАЖНО! Переменная добавлена в CMake версии 3.5.
##
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(
  HEADERS
    person.hpp
)

set(
  SOURCES
    person.cpp
    main.cpp
)

add_executable(print_base ${HEADERS} ${SOURCES})

set_target_properties(
  print_base
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/_/bin
)

# target_include_directories(
#   print_base
#   PRIVATE ${CMAKE_SOURCE_DIR}
# )

find_package(GTest)

set(
  SOURCES_TEST
    person.cpp
    main_test.cpp
)

add_executable(print_base_test ${HEADERS} ${SOURCES_TEST})

set_target_properties(
  print_base_test
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/_/test
)

target_link_libraries(
  print_base_test
  PRIVATE GTest::gtest
)

