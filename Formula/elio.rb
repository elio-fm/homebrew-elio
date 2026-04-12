class Elio < Formula
  desc "Terminal-native file manager with rich previews and inline images"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "f0db4d87253ff67ff212e66e06371f97f2c9a5ad7d02b1fc5a9cd3b15b006f75"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a8e540331d1575046d3c6db32299a817a0a9a053c67e447ad4c4a7bac7e25629"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5015fa8dcee5c0956e7b0af861768961e0c40d3258b45ca8dd968bd306d2aad0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"elio", :executable?
  end
end
