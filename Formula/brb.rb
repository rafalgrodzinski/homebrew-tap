class Brb < Formula
  BUILD_KIND = "dev".freeze
  VERSION = "1.0.0-dev-105".freeze
  SHA_256 = "418809480ac65cbaf3df9d189f3f8ce38ac9e0e1bcb132ee758d88e85280b311".freeze

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
