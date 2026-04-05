class Brb < Formula
  desc "Compiler for the Bits Runner Code language"
  homepage "https://github.com/rafalgrodzinski/bits-runner-builder"
  license ""

  version "1.0.0-dev-92"
  url "https://github.com/rafalgrodzinski/bits-runner-builder/archive/refs/heads/129-automated-cmake-for-build-installation-on-macos.zip"
  sha256 "d8147ac06ee883ee95af9008aa8824d9ad6bebf9b6c3b99b8686077784b95344"
  
  head "https://github.com/rafalgrodzinski/bits-runner-builder.git", branch: "main"
  
  depends_on "cmake" => :build
  depends_on "llvm@20"
  depends_on macos: :sonoma

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
