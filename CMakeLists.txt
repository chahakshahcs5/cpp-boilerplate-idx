cmake_minimum_required(VERSION 3.15)
project(LearnCpp)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Conan toolchain
include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

# Declare dependencies explicitly
find_package(fmt REQUIRED)

# Collect your sources
file(GLOB_RECURSE SOURCES "src/*.cpp")

# Remove examples folder
list(FILTER SOURCES EXCLUDE REGEX "src/examples/")

# Define the executable
add_executable(LearnCpp ${SOURCES})

# Include your own headers
target_include_directories(LearnCpp PRIVATE ${CMAKE_SOURCE_DIR}/include)

# Link against Conan-provided fmt target
target_link_libraries(LearnCpp PRIVATE fmt::fmt)
