#!/usr/bin/env bash
set -e

# Ensure conan is in PATH
export PATH="$HOME/.local/bin:$PATH"

# Set build type (Debug or Release). Defaults to Debug.
# Case-insensitive argument.
BUILD_TYPE_ARG=${1:-Debug}
if [[ ${BUILD_TYPE_ARG,,} == "release" ]]; then
    BUILD_TYPE="Release"
else
    BUILD_TYPE="Debug"
fi

BUILD_DIR="build/${BUILD_TYPE,,}" # build/debug or build/release

echo "========== Build Script (${BUILD_TYPE}) =========="
echo "Build directory: ${BUILD_DIR}"
echo "Conan version: $(conan --version)"
echo "=================================="

# Clean and create the build directory for the specific build type
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"

# Navigate to the build directory
pushd "${BUILD_DIR}" > /dev/null

# Install dependencies with Conan
# The conanfile.txt is two levels up from here.
conan install ../.. --output-folder=. --build=missing --settings=build_type=${BUILD_TYPE}

# Configure CMake
# The main CMakeLists.txt is two levels up.
cmake ../.. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
           -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake \
           -DCMAKE_BUILD_TYPE=${BUILD_TYPE}

# Build the project
cmake --build .

# Return to the original directory
popd > /dev/null

echo "Build successful. Executable at: ./${BUILD_DIR}/LearnCpp"
