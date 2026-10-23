class Brb < Formula
  BUILD_KIND = "dev".freeze
  VERSION = "1.0.0-dev-114".freeze
  SHA_256 = "3ca5f12dd67e7fdaa8462cc9a5c5e901f5c69d0110520a62f1bb1144b77b7025".freeze

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
