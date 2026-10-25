class Brb < Formula
  BUILD_KIND = "dev".freeze
  VERSION = "1.0.0-dev-115".freeze
  SHA_256 = "245b1641e59c4bf105ccb786704ee111e8a9fd7eba144119c63c86a05c397dd7".freeze

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

  test do
    assert_match version.to_s, shell_output("#{bin}/brb --version")
  end
end
