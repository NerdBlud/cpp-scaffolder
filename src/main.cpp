#include <iostream>
#include <scaffolder/cli.hpp>
#include <scaffolder/generator.hpp>

int main(int argc, char** argv) {
    try {
        auto options = scaffolder::parse_cli(argc, argv);

        if (options.command == "create") {
            bool ok = scaffolder::create_project(
                options.project_name,
                options.build_system,
                options.test_framework,
                options.ci_template
            );

            if (ok) {
                std::cout << "✅ Project '" << options.project_name << "' created successfully!\n";
                return 0;
            } else {
                std::cerr << "❌ Failed to create project.\n";
                return 1;
            }
        } else {
            std::cerr << "❌ Unknown command: " << options.command << "\n";
            return 1;
        }
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << "\n";
        return 1;
    }
}
