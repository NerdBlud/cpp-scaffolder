
# Getting Started with cpp-scaffolder

**cpp-scaffolder** is a command-line tool that generates modern, ready-to-build C++ projects with a single command.

---

## 1. Install cpp-scaffolder

### Linux / macOS

```bash
# Download the latest release
wget https://github.com/nerdblud/cpp-scaffolder/releases/download/v0.1.0/cpp-scaffolder-linux-x64.tar.gz

# Extract it
tar -xzf cpp-scaffolder-linux-x64.tar.gz

# Move the executable to a location in your PATH
sudo mv cpp-scaffolder /usr/local/bin/
```

### Windows

1. Download `cpp-scaffolder.exe` from the [releases page](https://github.com/nerdblud/cpp-scaffolder/releases).
2. Add it to your `PATH` so you can run it from any terminal.

---

## 2. Create a New Project

Run the scaffolder to generate a new C++ project:

```bash
cpp-scaffolder create my_project --build=cmake --tests=catch2 --ci=github
```

**Options explained:**

* `--build` → Build system (`cmake`, `meson`, or `bazel`)
* `--tests` → Unit test framework (`catch2`, `googletest`, `doctest`)
* `--ci` → CI/CD template (`github` or `gitlab`)

This will create a folder `my_project/` with all necessary files and structure.

---

## 3. Build Your Project

```bash
cd my_project
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
```

> Adjust commands if you selected a different build system.

---

## 4. Run Tests

```bash
ctest --test-dir build
```

All scaffolded unit tests (e.g., `test_example.cpp`) will be executed.

---

## 5. Project Structure

After scaffolding, your project will look like this:

```
my_project/
├── CMakeLists.txt
├── src/
├── include/
├── tests/
├── examples/
├── scripts/
├── .github/
├── docs/
├── .clang-format
├── .clang-tidy
└── LICENSE
```

---

## 6. Start Coding

* **Source files:** `src/`
* **Headers:** `include/`
* **Tests:** `tests/`

Add your code and tests, then build and run with the same commands above.

---

## 7. Next Steps

* Explore different build systems (`meson` or `bazel`)
* Customize CI/CD templates
* Add additional templates or modify existing ones

---