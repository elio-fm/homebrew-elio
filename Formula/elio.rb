class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.11.2.tar.gz"
  sha256 "a0b30f139febc462ebc2ae20b641e358db4a8935c5262a30241fa12d822ded25"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.11.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "08641b7ddebb708cc737a8a2bb1954d0206d9f1803f8f7d56ed5add2011cabdb"
    sha256 cellar: :any,                 x86_64_linux: "e835a2fa00e53cb80ad16caa6dc3e23fd2bea7270a494f35de41c034bf6d2cbb"
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
