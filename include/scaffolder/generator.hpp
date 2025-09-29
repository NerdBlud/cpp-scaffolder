#pragma once
#include <string>

namespace scaffolder {

struct ProjectOptions {
    std::string name;
    std::string build_system;
    std::string test_framework;
    std::string ci_template;
};

bool create_project(const std::string &project_name,
                    const std::string &build_system,
                    const std::string &test_framework,
                    const std::string &ci_template);

} 
