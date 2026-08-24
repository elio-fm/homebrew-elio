class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.12.0.tar.gz"
  sha256 "89c8bcb656dbee17cccfd4b0e676523bc1f3ff34c63a84ab8327646ce72984c6"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.12.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8856d4d5c7a9ced93ee2465c2c5f0ad731e1edf71572a94a74d9c4f701de6b9d"
    sha256 cellar: :any,                 x86_64_linux: "ec8c9bfc0ed639204e9b5966ddc1e82a7c5b386edf290b2e19f3abfed7c8e53e"
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
