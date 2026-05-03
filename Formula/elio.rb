class Elio < Formula
  desc "Terminal-native file manager with rich previews and inline images"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "eca57b4b687ce4e2a18952db37c4dddf53179c5fc3331c91caefc0c6d3ba605b"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "05ca752f58cbf57a0c1a9e4dc48f5392c213077691a4d537240da2057b8fe231"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cac04362cac2d844c0f02b28af941d780f0626396a65fb417139d47f07683c81"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"elio", :executable?
  end
end
