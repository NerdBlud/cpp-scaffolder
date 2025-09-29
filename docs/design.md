
# Design Overview of cpp-scaffolder

## 🎯 Goals

`cpp-scaffolder` is designed to:

1. **Quickly generate modern C++ projects** with minimal setup.
2. **Support multiple build systems**: CMake, Meson, Bazel.
3. **Provide unit test boilerplate** (Catch2, GoogleTest, doctest).
4. **Include CI/CD templates** for GitHub Actions or GitLab.
5. **Support dependency management** with CPM.cmake or vcpkg.
6. **Be cross-platform**, working on Linux, macOS, and Windows.

---

## 🏗 Architecture

```
cpp-scaffolder/
├── src/
│   ├── main.cpp           # CLI entry point
│   ├── cli.cpp            # Command parsing and handling
│   └── generator/         # Build system generators
│       ├── cmake_generator.cpp
│       ├── meson_generator.cpp
│       └── bazel_generator.cpp
├── include/               # Public headers (optional)
│   └── scaffolder/
├── templates/             # Project templates
│   ├── cmake/
│   ├── meson/
│   └── bazel/
├── tests/                 # Unit tests for the scaffolder
└── scripts/               # Build & packaging helpers
```

---

### 🔹 Components

1. **CLI (`main.cpp` + `cli.cpp`)**

   * Parses user commands (`create`, `list-templates`, `help`, etc.).
   * Validates options like build system, test framework, and CI/CD choice.

2. **Generators (`generator/`)**

   * Each generator handles one build system: CMake, Meson, or Bazel.
   * Creates project directories, copies template files, and fills in placeholders.

3. **Templates (`templates/`)**

   * Contains boilerplate project files (CMakeLists.txt, main.cpp, test files).
   * Supports placeholders for project name, license, and user options.

4. **Tests (`tests/`)**

   * Ensures CLI commands work as expected.
   * Verifies generated projects have correct structure and content.

5. **Scripts (`scripts/`)**

   * Automates building the scaffolder itself.
   * Packages prebuilt binaries for Windows, Linux, and macOS.

---

## 💡 Design Principles

* **Single Responsibility:** Each generator handles only its build system.
* **Extensible:** Easy to add new build systems or test frameworks in the future.
* **Cross-platform:** Uses standard C++ and minimal dependencies to ensure portability.
* **User-friendly CLI:** Clear commands and flags for project creation.
* **Template-driven:** Project structure and files can be easily customized or extended.

---

