cmake_minimum_required(VERSION 3.16)
target_include_directories(test_cli PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
# ------------------------------
# Project setup
# ------------------------------
project(my_project
    VERSION 0.1.0
    DESCRIPTION "A modern C++ project scaffold"
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ------------------------------
# Options
# ------------------------------
option(MY_PROJECT_BUILD_TESTS "Build tests" ON)
option(MY_PROJECT_INSTALL "Enable installation of library" OFF)
option(MY_PROJECT_USE_VCPKG "Use vcpkg for dependencies instead of CPM" OFF)

# ------------------------------
# Dependencies
# ------------------------------
if (NOT MY_PROJECT_USE_VCPKG)
    include(cmake/CPM.cmake)

    CPMAddPackage(
        NAME Catch2
        GITHUB_REPOSITORY catchorg/Catch2
        VERSION 3.4.0
    )
endif()

# ------------------------------
# Library target
# ------------------------------
add_library(${PROJECT_NAME}
    src/example.cpp
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_20)

if (MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE /W4 /permissive-)
else()
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic)
endif()

# ------------------------------
# Executable target
# ------------------------------
add_executable(${PROJECT_NAME}_app
    src/main.cpp
)

target_link_libraries(${PROJECT_NAME}_app
    PRIVATE
        ${PROJECT_NAME}
)

# ------------------------------
# Tests
# ------------------------------
if (MY_PROJECT_BUILD_TESTS)
    enable_testing()

    add_executable(${PROJECT_NAME}_tests
        tests/test_example.cpp
    )

    if (MY_PROJECT_USE_VCPKG)
        find_package(Catch2 3 REQUIRED)
        target_link_libraries(${PROJECT_NAME}_tests PRIVATE ${PROJECT_NAME} Catch2::Catch2WithMain)
    else()
        target_link_libraries(${PROJECT_NAME}_tests PRIVATE ${PROJECT_NAME} Catch2::Catch2WithMain)
    endif()

    include(CTest)
    include(Catch)
    catch_discover_tests(${PROJECT_NAME}_tests)
endif()

# ------------------------------
# Install 
# ------------------------------
if (MY_PROJECT_INSTALL)
    include(GNUInstallDirs)

    install(TARGETS ${PROJECT_NAME}
        EXPORT ${PROJECT_NAME}Targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    )

    install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

    install(EXPORT ${PROJECT_NAME}Targets
        FILE ${PROJECT_NAME}Config.cmake
        NAMESPACE ${PROJECT_NAME}::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
    )
endif()
