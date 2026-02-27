# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.gcc
    pkgs.clang
    pkgs.clang-tools
    pkgs.gdb
    pkgs.cmake
    pkgs.python3
    pkgs.python3Packages.pip
    pkgs.gnumake
    pkgs.conan
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "jeff-hykin.better-cpp-syntax"
      "franneck94.vscode-c-cpp-config"
      "llvm-vs-code-extensions.vscode-clangd"
      "twxs.cmake"
      "ms-vscode.cmake-tools"
      "cheshirekow.cmake-format"
      "vadimcn.vscode-lldb"
      "ms-vscode.makefile-tools"
      "KylinIdeTeam.cppdebug"
    ];
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        setup-and-build = "conan profile detect && chmod +x ./build.sh && ./build.sh";
        default.openFiles = [ ".idx/dev.nix" "README.md" ];
      };
      # Runs when the workspace is (re)started
      onStart = {
        run = "./build/MyCppApp";
      };
    };
  };
}
