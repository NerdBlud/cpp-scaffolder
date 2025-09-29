#pragma once
#include <string>

namespace scaffolder {

struct CLIOptions {
    std::string command;
    std::string project_name;
    std::string build_system;
    std::string test_framework;
    std::string ci_template;
};

CLIOptions parse_cli(int argc, char** argv);

} 
