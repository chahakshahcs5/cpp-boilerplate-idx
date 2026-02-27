# C++ Boilerplate with Conan as package manager for Firebase Studio

This is a sample C++ project that demonstrates how to use CMake and the [Conan](https://conan.io/) package manager within the Firebase Studio environment.

## Dependencies

This project uses the following libraries, managed by Conan:
- **`fmt/10.2.1`**: A modern formatting library.

## How to Build and Run (Recommended)

This project is configured to be easily built and run directly within VS Code using predefined tasks and launch configurations.

### 1. Run with Debugging (`F5`)

This is the recommended workflow for development.

- Press **`F5`** on your keyboard (or go to `Debug > Start Debugging`).

This single action will automatically:
1.  **Build** the project by executing the `build.sh` script.
2.  **Run** the compiled application (`./build/MyCppApp`).
3.  **Attach** the VS Code debugger, allowing you to set breakpoints and inspect variables.

### 2. Run Without Debugging (`Ctrl+F5`)

Use this if you want to quickly build and run the application without the debugger.

- Press **`Ctrl+F5`** on your keyboard (or go to `Debug > Run Without Debugging`).

This will build the project and run the application in the terminal.

### 3. Using the VS Code Task Runner

You can also run the pre-defined tasks manually.

1.  Open the Command Palette with **`Ctrl+Shift+P`**.
2.  Type **`Tasks: Run Task`** and press Enter.
3.  Select one of the following tasks:
    -   **`Run App`**: Builds and runs the application without the debugger.
    -   **`CMake Build`**: Only builds the project.

## Manual Build & Run from the Terminal

If you prefer to work from the command line, you have a couple of options.

### Simple Build Script

The easiest way to build the project is to run the provided shell script. This handles all the necessary steps.

```bash
sh build.sh
```

### Detailed Build Commands (Clean Start)

These are the individual commands that the `build.sh` script runs. Use these for a more granular understanding or if you need to debug the build process itself.

```bash
# Clean previous build artifacts
rm -rf build
rm -f CMakeUserPresets.json

# Create build directory
mkdir build
cd build

# Install Conan dependencies
conan install .. --output-folder=. --build=missing --settings=build_type=Debug

# Configure with CMake
cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Debug

# Build the project
cmake --build .
```

### Run the Application

After a successful build, you can run the executable directly:

```bash
./build/MyCppApp
```
