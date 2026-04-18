class Elio < Formula
  desc "Terminal-native file manager with rich previews and inline images"
  homepage "https://github.com/elio-fm/elio"
  url "https://github.com/elio-fm/elio/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "225fe5fba1a066458c54169196831859af0bd71539978cad9b326e627ca41803"
  license "MIT"

  bottle do
    root_url "https://github.com/elio-fm/homebrew-elio/releases/download/elio-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "880cd1536f2692b4e018b549ba6eac90cbbb0a5bd200e67096e46b0ce75d0c2e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e46b5cb3ad50977191b9072bfa0873f1a7cbb128a3c3786da643fd4567bbe6ea"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"elio", :executable?
  end
end
