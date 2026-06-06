class Brb < Formula
  BUILD_KIND = "dev".freeze
  VERSION = "1.0.0-dev-102".freeze
  SHA_256 = "8986bac0b081f51e73eae2b1b11630de53a53261c0eb402dcd5a0bd2d6764069".freeze

  desc "Compiler for the Bits Runner Code language"
  homepage "https://github.com/rafalgrodzinski/bits-runner-builder"

  url "https://github.com/rafalgrodzinski/bits-runner-builder/archive/refs/tags/#{BUILD_KIND}/#{VERSION}.tar.gz"
  version VERSION
  sha256 SHA_256
  license ""

  head "https://github.com/rafalgrodzinski/bits-runner-builder.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "llvm@20"
  depends_on macos: :sonoma

  def install
    ENV["VERSION"] = VERSION
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
