#include <scaffolder/cli.hpp>
#include <iostream>

namespace scaffolder {

CLIOptions parse_cli(int argc, char** argv) {
    CLIOptions opts;

    if (argc < 2) {
        throw std::runtime_error("No command provided. Usage: cpp-scaffolder create <project_name>");
    }

    opts.command = argv[1];

    if (opts.command == "create") {
        if (argc < 3) {
            throw std::runtime_error("Missing project name. Usage: cpp-scaffolder create <project_name>");
        }

        opts.project_name = argv[2];
        opts.build_system = "cmake";
        opts.test_framework = "catch2";
        opts.ci_template = "github";
    }

    return opts;
}

} 
