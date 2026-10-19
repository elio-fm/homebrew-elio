class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.14.0.tar.gz"
  sha256 "7a78b104e48f94a0460333a02f5e5f3a95dad11ec21a24e2b0be69d6e1974799"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.14.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "56d57fd912cfd3923a2a8dbc32e96aca9befb333d27136c69c636a642d450242"
    sha256 cellar: :any,                 x86_64_linux: "bebfbf40cb1877010a2810214954ada7ff571dd7a7568fc26a6d0f0972a8db55"
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
