class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.15.0.tar.gz"
  sha256 "29e7d527ccadbfb8e0d22b15569ba566a33706bc63345f96c44a6717f6ac634c"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.15.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c1ae992799b7c0d2ae7533ae7d4c4fb7baa73b4e37dd6768c53c7a6914183e81"
    sha256 cellar: :any,                 x86_64_linux: "144771b73fe4bfa72e48656b1c86f207bf34fb57507a6ff13499817a43ef31d9"
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
