
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

  add_executable(status-provider-test)

  set_target_properties(status-provider-test PROPERTIES AUTOMOC ON)

  target_compile_features(status-provider-test PRIVATE cxx_std_23)

  target_sources(status-provider-test PRIVATE status_provider_test.cc status_provider.cc)

  target_link_libraries(status-provider-test PRIVATE Qt::Test)

  add_test(NAME status-provider COMMAND status-provider-test)

endif( )

add_executable(sample-0007)

set_target_properties(sample-0007 PROPERTIES AUTOMOC ON)

target_compile_features(sample-0007 PRIVATE cxx_std_23)

target_sources(sample-0007 PRIVATE main.cc status_provider.cc)

target_link_libraries(
  sample-0007

  PRIVATE
    Qt::Gui
    Qt::Qml
    Qt::Quick
    Spix::QtQuick
)

