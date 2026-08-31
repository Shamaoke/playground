# Sample-0005: UserModel with Qt Quick (QML + Models & Views)

## Overview
Educational project demonstrating integration of C++ and QML in Qt 6.
Focuses on:
- Creating a custom C++ model (`UserModel`)
- Exporting C++ to QML using `QML_ELEMENT`
- Registering QML modules via CMakeLists.txt
- Displaying data using QML ListView and C++ model

## Project Structure
```
source/
├── CMakeLists.txt       - Build configuration
├── main.cpp             - Application entry point
├── user_model.hh        - UserModel class header
├── user_model.cc        - UserModel implementation
├── Main.qml             - Main QML interface
└── Style.qml            - Application styles (singleton)
```

## Requirements
- Qt 6.4 or later
- CMake 3.25+
- C++17 compiler (GCC, Clang, or MSVC)

## Building
```bash
cd build-debug
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build .
```

## Running
```bash
./bin/sample_0005
```

## Learning Objectives
1. Understand Qt Model-View architecture
2. Learn how to export C++ classes to QML
3. Practice using `QML_ELEMENT` and `qt_add_qml_module`
4. Integrate C++ business logic with QML UI

## Notes
- This is an educational project for learning Qt/QML
- Based on Qt5 Cadaques book examples
- Part of the learning playground series
