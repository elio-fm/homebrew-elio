class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "daeb030bc90438c0d3d0c69be2d10f6b01bfd7f2792c7cfdc940db79c2077a1d"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.7.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6a9ce5e9a30d5398d4ee1131f05960588c2e249dddc95b48642d1bd58307624b"
    sha256 cellar: :any,                 x86_64_linux: "0cecc6e13daf8a51663636f2f4163a6eff107397aef5ee0cad1f84bb1e88ffb9"
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
