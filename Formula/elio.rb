class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.10.0.tar.gz"
  sha256 "332ea7a7437f820ab732842f1674c9b8436e0b7c2a0dbece0a52155843a8001a"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.10.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7ca9418ef702195ed39a2f4643dbcdf62de0b7bb90d6a0a44d6efa7f274482ab"
    sha256 cellar: :any,                 x86_64_linux: "51d1499cd450fbdb7186c4fc59c073dfe8ad3949a8b2e84a3c02a36e891e10bb"
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
