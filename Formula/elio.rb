class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.11.1.tar.gz"
  sha256 "e99d3b8403a3aa77eda5ab75d88f47a5b39468a82df530059af73485c149b7ca"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.11.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d508729b5fef44b4864e3a9cdc3643c98da5ec57388d94b76f9a4d4274df9a7a"
    sha256 cellar: :any,                 x86_64_linux: "1756dc021139a3c7b72deec8c8b1e5d5b77a944bcd75d7cc39dee30f8f5514cf"
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
