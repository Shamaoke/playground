
cmake_minimum_required(VERSION 4.4)

project(sample-0007 VERSION 0.0.0 LANGUAGES CXX)

include(CTest)

find_package(
  Qt6 6.12

  COMPONENTS
    Gui
    Qml
    Quick

  REQUIRED
)

find_package(
  Spix

  CONFIG

  COMPONENTS
    Core
    QtQuick

  REQUIRED
)

if(BUILD_TESTING)
  find_package(
    Qt6 6.12

    COMPONENTS
      Test

    REQUIRED
  )

  add_executable(status-test)

  target_compile_features(status-test PRIVATE cxx_std_23)

  target_sources(status-test PRIVATE status_test.cc)

  target_link_libraries(status-test PRIVATE Qt::Test)

  set_target_properties(status-test PROPERTIES AUTOMOC ON)

  add_test(NAME status COMMAND status-test)

endif( )

add_executable(sample-0007)

target_compile_features(sample-0007 PRIVATE cxx_std_23)

target_sources(sample-0007 PRIVATE main.cc)

target_link_libraries(
  sample-0007

  PRIVATE
    Qt::Gui
    Qt::Qml
    Qt::Quick
    Spix::QtQuick
)
