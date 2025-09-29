cmake_minimum_required(VERSION 3.16)

project(cpp_scaffolder
    VERSION 0.1.0
    DESCRIPTION "A modern C++ project scaffolder CLI"
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ------------------------------
# Dependencies (Catch2 for tests)
# ------------------------------
include(cmake/CPM.cmake)

CPMAddPackage(
    NAME Catch2
    GITHUB_REPOSITORY catchorg/Catch2
    VERSION 3.4.0
)

# ------------------------------
# Library target (scaffolder core logic)
# ------------------------------
add_library(${PROJECT_NAME}_lib
    src/generator.cpp
    src/cli.cpp
)

target_include_directories(${PROJECT_NAME}_lib
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

target_compile_features(${PROJECT_NAME}_lib PUBLIC cxx_std_20)

if (MSVC)
    target_compile_options(${PROJECT_NAME}_lib PRIVATE /W4 /permissive-)
else()
    target_compile_options(${PROJECT_NAME}_lib PRIVATE -Wall -Wextra -Wpedantic)
endif()

# ------------------------------
# Executable target
# ------------------------------
add_executable(${PROJECT_NAME}
    src/main.cpp
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        ${PROJECT_NAME}_lib
)

# ------------------------------
# Tests
# ------------------------------
enable_testing()

add_executable(${PROJECT_NAME}_tests
    tests/test_cli.cpp
)

target_link_libraries(${PROJECT_NAME}_tests
    PRIVATE
        ${PROJECT_NAME}_lib
        Catch2::Catch2WithMain
)

include(CTest)
include(Catch)
catch_discover_tests(${PROJECT_NAME}_tests)
