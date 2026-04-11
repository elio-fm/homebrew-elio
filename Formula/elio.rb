class Elio < Formula
  desc "Terminal-native file manager with rich previews and inline images"
  homepage "https://github.com/MiguelRegueiro/elio"
  url "https://github.com/MiguelRegueiro/elio/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7d910f53ca390831f14123177fa6c930976de2a4b5320af70ff3ff1b0fbd1f10"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"elio", :executable?
  end
end
