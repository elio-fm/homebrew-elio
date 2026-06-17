class Elio < Formula
  desc "Batteries-included terminal file manager with rich previews"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "c8a43ff0fd8ffcbbf48296b6d26ad02a123e882cbfb832a0a9c2e3c00576109b"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.9.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "686e5c4252bcf9e8051a579d13ed26d784e84a32b68e12c3e4f68a092be7528d"
    sha256 cellar: :any,                 x86_64_linux: "079184d6e4d1e21c49b37868552ced7188d3cd92f8f8eae44f2c3bbfc3682b94"
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
