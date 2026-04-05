class Brb < Formula
  desc "Compiler for the Bits Runner Code language"
  homepage "https://github.com/rafalgrodzinski/bits-runner-builder"
  license ""

  version "1.0.0"
  url "https://github.com/rafalgrodzinski/bits-runner-builder/archive/refs/heads/129-automated-cmake-for-build-installation-on-macos.zip"
  sha256 "4ccb1d0f82f114a3975a319af4ead5aac76f5d2d37f8a1e8c51c97f03f460027"
  
  depends_on "cmake" => :build
  depends_on "llvm@20"
  depends_on macos: :sonoma

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
