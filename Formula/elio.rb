class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "e6fcdf85556b21048ea07f42057947f34af3ee7eb84136f1f0e322074d3af19c"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.8.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "40d4dcfbce32e25a462097ea34233818f625cc5e2ec427530d288aa39d2cc9b7"
    sha256 cellar: :any,                 x86_64_linux: "48fffb0b84865c1e89e23f20e97c118413c9ba8912cd04f9ea132fa5a46a0010"
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
