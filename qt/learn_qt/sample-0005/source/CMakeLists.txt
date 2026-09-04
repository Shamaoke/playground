
##
## ::: Sample 0005 | Build management file :::
##

cmake_minimum_required(VERSION 4.4)

project(sample-0005 VERSION 0.0.0 LANGUAGES CXX)

find_package(
  Qt6 6.11

  REQUIRED COMPONENTS
    Gui
)

qt_standard_project_setup(REQUIRES 6.11)

set(SOURCES main.cc)

add_executable(sample-0005 ${SOURCES})

target_compile_features(sample-0005 PRIVATE cxx_std_23)

target_link_libraries(sample-0005 PRIVATE Qt::Gui)

