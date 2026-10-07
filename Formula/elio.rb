class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.13.0.tar.gz"
  sha256 "8025df57d84f3aeadd8eadeae2b293f66ad43b8b683d787a55a6ec314adf0e19"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.13.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3905bdfecdde82d0b9bde8896b8378ae79bee12e254b2709b1377bf587719af7"
    sha256 cellar: :any,                 x86_64_linux: "2ba88e996f757ed9915c13168edcce467a28396569cae54e343f66cfcadf0f94"
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
