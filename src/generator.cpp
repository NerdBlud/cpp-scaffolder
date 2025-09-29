#include <scaffolder/generator.hpp>
#include <filesystem>
#include <fstream>
#include <iostream>

namespace fs = std::filesystem;

namespace scaffolder {

bool create_project(const std::string &project_name,
                    const std::string &build_system,
                    const std::string &test_framework,
                    const std::string &ci_template) {
    if (project_name.empty()) {
        std::cerr << "❌ Project name cannot be empty.\n";
        return false;
    }

    fs::path project_path = project_name;

    if (fs::exists(project_path)) {
        std::cerr << "❌ Project '" << project_name << "' already exists.\n";
        return false;
    }

    fs::create_directories(project_path / "src");
    fs::create_directories(project_path / "tests");

    std::ofstream main_file(project_path / "src/main.cpp");
    main_file << "#include <iostream>\n\nint main() {\n"
              << "    std::cout << \"Hello from " << project_name << "!\" << std::endl;\n"
              << "    return 0;\n}\n";

    std::ofstream cmake_file(project_path / "CMakeLists.txt");
    cmake_file << "cmake_minimum_required(VERSION 3.16)\n"
               << "project(" << project_name << " LANGUAGES CXX)\n\n"
               << "set(CMAKE_CXX_STANDARD 20)\n"
               << "add_executable(" << project_name << " src/main.cpp)\n";

    return true;
}

} 
