
##
## ::: Sample 0005 | Build management file :::
##

cmake_minimum_required(VERSION 4.4)

project(sample-0005 VERSION 0.0.0 LANGUAGES CXX)

find_package(
  Qt6 6.11

  REQUIRED COMPONENTS
    Gui
    Qml
)

qt_standard_project_setup(REQUIRES 6.11)

#
# set(SOURCES main.cc)
#
# add_executable(sample-0005 ${SOURCES})
#

# file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS "*.cc")

file(GLOB HEADERS CONFIGURE_DEPENDS "include/*.hh")
file(GLOB SOURCES CONFIGURE_DEPENDS "*.cc")

add_executable(sample-0005)

target_compile_features(sample-0005 PRIVATE cxx_std_23)

target_sources(sample-0005 PRIVATE ${HEADERS} ${SOURCES})

target_include_directories(sample-0005 PRIVATE include)

qt_add_qml_module(
  sample-0005
  URI learn_qt.sample_0005
  QML_FILES
    views/Application.qml
    views/Users.qml
)

target_link_libraries(
  sample-0005

  PRIVATE
    Qt::Gui
    Qt::Qml
)

