class Elio < Formula
  desc "Terminal-native file manager with rich previews and inline images"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "8317d60fd497cff643bbf2ee6a434bcb4e3b084fd5be721cb15d734ad92b324e"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1feba3d3b1c9c19a926b2518d86d568b4c914a265a6c31bf4b87dead3fb7b247"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4dfd88f64cb97336376d248ad8496b7bad09f7b662ee04cf8035f5931a5723db"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"elio", :executable?
  end
end
