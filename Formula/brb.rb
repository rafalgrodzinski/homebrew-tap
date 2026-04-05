class Brb < Formula
  desc "Compiler for the Bits Runner Code language"
  homepage "https://github.com/rafalgrodzinski/bits-runner-builder"
  license ""

  url "https://github.com/rafalgrodzinski/bits-runner-builder/archive/refs/tags/dev/1.0.0-dev-92.tar.gz"
  sha256 "ba657f1836a48a4e77e45d62ac8ddf7b55b395187df6a26c8958e52aaf1effb7"
  version "1.0.0-dev-92"

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
