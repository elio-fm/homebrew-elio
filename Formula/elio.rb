class Elio < Formula
  desc "Terminal-native file manager with rich previews and inline images"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "ddda8035271e09987ebda2cf18289004966cedd346fc4857908a3eadc4526cb9"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f7f5708ecd48ab4fdd8f51a9ace4cdc9b2277ae25a0f3c01f101ee7e386c6ff3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f0e7d84e5834a2ae148842e03cde6d244c025806f9575eccfb70a6aa83943960"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"elio", :executable?
  end
end
