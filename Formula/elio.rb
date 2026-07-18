class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.11.0.tar.gz"
  sha256 "0c22cbbaf2d79edef3ee8bfd17e44a6273164d2090c30e05004fed259a3d689e"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.11.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "934837dbb46de9394218f157c7cd222331563327a28c982670992a179ee976ec"
    sha256 cellar: :any,                 x86_64_linux: "4e10069043a37f75edc274317bfc8a08896a9fe02fb21c84c8848ed4615b78b4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    missing = testpath/"missing-directory"
    output = shell_output("#{bin}/elio #{missing} 2>&1", 1)
    assert_match "no such file or directory", output
  end
end
