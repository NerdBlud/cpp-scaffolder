# cpp-scaffolder by nerdblud

**A modern C++ project scaffolder — automatically generates clean, ready-to-build C++ projects with CMake, tests, and CI/CD.**

---

## 🚀 Features

* Generates a **full C++ project structure**:
  * `src/` for source code
  * `include/` for headers
  * `tests/` for unit tests (Catch2, GoogleTest, or doctest)
  * `examples/` for demo projects
* **Supports multiple build systems**: CMake, Meson, Bazel
* **Automates dependency management**:
  * `CPM.cmake` for modern CMake projects
  * Optional `vcpkg` integration
* **Optional CI/CD templates**:
  * GitHub Actions or GitLab CI
* Adds `.clang-format` and `.clang-tidy` for consistent code style
* Easy install/export support for libraries

---

## 📂 Generated Project Layout Example

```

my_project/
├── CMakeLists.txt
├── src/
│   └── main.cpp
├── include/
│   └── my_project/
├── tests/
│   └── test_example.cpp
├── examples/
├── scripts/
├── .github/
│   └── workflows/
├── docs/
├── .clang-format
├── .clang-tidy
├── .gitignore
├── LICENSE
└── vcpkg.json

````

---

## ⚡ Quick Start

```bash
# Clone cpp-scaffolder
git clone https://github.com/nerdblud/cpp-scaffolder.git
cd cpp-scaffolder

# Build the scaffolder itself
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build

# Run scaffolder to create a new project
./build/cpp-scaffolder create my_project --build=cmake --tests=catch2 --ci=github
````

---

## 🛠 Options

| Option    | Description                                               |
| --------- | --------------------------------------------------------- |
| `--build` | Select build system (`cmake`, `meson`, `bazel`)           |
| `--tests` | Select test framework (`catch2`, `googletest`, `doctest`) |
| `--ci`    | Include CI/CD template (`github`, `gitlab`)               |
| `--deps`  | Dependency manager (`cpm`, `vcpkg`)                       |

---

## 📚 Why Use This Scaffolder?

* Saves **hours of setup time**
* Ensures **modern C++ best practices** from day one
* Makes projects **cross-platform and CI-ready**
* Provides a **consistent code style** and automated testing framework

---

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines.

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.