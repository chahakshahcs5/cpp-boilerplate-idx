#include "app/hello.hpp"
#include <fmt/core.h>

int main() {
  fmt::print("Using fmt with Conan 🎉\n");

  std::string greetMessage = greet("Chahak");

  fmt::print("{}\n", greetMessage);

  return 0;
}