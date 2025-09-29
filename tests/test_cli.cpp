#define CATCH_CONFIG_MAIN
#include <catch2/catch_all.hpp>
#include <fstream>
#include <filesystem>
#include "../include/scaffolder/generator.hpp"

namespace fs = std::filesystem;

TEST_CASE("CLI generates project folder") {
    const std::string test_project = "test_project";

    if(fs::exists(test_project)) fs::remove_all(test_project);

    bool success = scaffolder::create_project(test_project, "cmake", "catch2", "github");

    REQUIRE(success);
    REQUIRE(fs::exists(test_project));
    REQUIRE(fs::exists(test_project + "/CMakeLists.txt"));
    REQUIRE(fs::exists(test_project + "/src/main.cpp"));

    fs::remove_all(test_project);
}

TEST_CASE("CLI fails on invalid project name") {
    bool success = scaffolder::create_project("", "cmake", "catch2", "github");
    REQUIRE(!success);
}
