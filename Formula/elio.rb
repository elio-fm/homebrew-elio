class Elio < Formula
  desc "Terminal-native file manager with rich previews and inline images"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "8b6840919a95b6f81c9d2982e10fcd0db736dbe28468784352c0f5a381f7fa79"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4cc0fde2274e09aa18bd2482d5512b9470312ad788a0fe28fbf3515085958dd4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "17f29a8cc64bbd8707450a9cdf02a565d7bf85b9a649b66f19b43aa24fa74cf0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"elio", :executable?
  end
end
