cmake_minimum_required(VERSION 3.15)
project(MyCppApp)

set(CMAKE_CXX_STANDARD 17)

# Conan toolchain
include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

# Declare dependencies explicitly
find_package(fmt REQUIRED)

# Collect your sources
file(GLOB_RECURSE SOURCES "src/*.cpp")

# Define the executable
add_executable(MyCppApp ${SOURCES})

# Include your own headers
target_include_directories(MyCppApp PRIVATE ${CMAKE_SOURCE_DIR}/include)

# Link against Conan-provided fmt target
target_link_libraries(MyCppApp PRIVATE fmt::fmt)
