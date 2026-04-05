class Brb < Formula
  desc "Compiler for the Bits Runner Code language"
  homepage "https://github.com/rafalgrodzinski/bits-runner-builder"
  license ""

  version "1.0.0"
  url "https://github.com/rafalgrodzinski/bits-runner-builder/archive/refs/tags/dev/1.0.0-dev-91.tar.gz"
  sha256 "09b320d4ebce8929a54408d39a32578f5799393d24dec992930f89823c904ece"

  depends_on "cmake" => :build
  depends_on "llvm@20"
  depends_on macos: :sonoma

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end
end
