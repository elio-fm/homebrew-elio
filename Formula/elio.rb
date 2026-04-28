class Elio < Formula
  desc "Terminal-native file manager with rich previews and inline images"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "26db49dff4bb2bb3fe47d27466d06f8da922a6779154eedd0c8c57fa0cdee822"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "19559793b2a43dbc42d263c0ce371f3499d17ea6d04ecb1485dd66a9eec5d428"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c519db675045bb96e1531eb5892651e943051ebf3b105a658cf27eba851948f3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"elio", :executable?
  end
end
