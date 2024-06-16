# Main CMakelists for the boilerplate project.
# It aims to be a template and a CMake reference, documented as much as possible.
# While not everything may fit every project, it provides good defaults and avoids CMake antipatterns.

cmake_minimum_required(VERSION 3.14)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
    message(FATAL_ERROR "Do not build in-source. Please remove CMakeCache.txt and the CMakeFiles/ directory. Then build out-of-source.")
endif()

project(
    "usb-notify"
    VERSION 0.1.0
    LANGUAGES C CXX
)

# Include standard CMake modules
include(FetchContent)  # Dependency management

# Add executable
add_executable(${PROJECT_NAME})

# Add all sources and header
add_subdirectory(inc)
add_subdirectory(src)

# Check if certain config defined
option(CFG_USE_SOUND_NOTIFICATION "Turn on sound notification" ON)
if(CFG_USE_SOUND_NOTIFICATION)
    target_compile_definitions(${PROJECT_NAME} PRIVATE USB_NOTIFY_PLAY_SOUND)
endif(CFG_USE_SOUND_NOTIFICATION)

# Add compile options
target_compile_options(${PROJECT_NAME} PRIVATE -ansi -pedantic -g -std=c99 -W -Wextra -Wall)

# Check for package
find_package(PkgConfig REQUIRED)
pkg_check_modules(deps REQUIRED IMPORTED_TARGET glib-2.0 libnotify udev)

# Link project to dependencies
target_link_libraries(${PROJECT_NAME} PkgConfig::deps -ludev)
