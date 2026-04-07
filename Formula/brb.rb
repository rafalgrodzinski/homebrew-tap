class Brb < Formula
  BUILD_KIND = "dev".freeze
  VERSION = "1.0.0-dev-95".freeze
  SHA_256 = "aaad4257b57724c17b5dfa9118dcdc7b6ee110434d2976b341235ee6a1a26eda".freeze

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
    system "VERSION=#{VERSION}", "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
