class Elio < Formula
  desc "Terminal-native file manager with rich previews and inline images"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "05eaa6dc6bd4f9932e13c28f0e100aba3d5f4515c3c8c04a4befc045223b67ef"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c4626398dd5cf3b5a815b7d13f3240e6753b9ec2a9c150cbb7e4e14ad056a7d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "61e56a107e3b488367d316a71831dd4a2aa1fe59927940153d439049a75e2f7e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"elio", :executable?
  end
end
