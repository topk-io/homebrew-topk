class Topk < Formula
  desc "Turn raw files into searchable knowledge"
  homepage "https://topk.io"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-apple-darwin.tar.gz"
      sha256 "e03b6cc906a44edd062674b65785d7f3992b7581de3c04fbda5f60e9ff8b8b7f"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-apple-darwin.tar.gz"
      sha256 "a6d2c4df0de2f34a74ae64c99508d3be60ab1bf917f715dbfce69cbdcc52db37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02ed7d67d741ab438233270f2c7500776e41611d7698fb9b9527e902fcd35584"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e1d213196dfa57c9a3ccf24a8575ca1ca265464224fabc3512a7b0f72a9c2f3"
    end
  end

  def install
    bin.install "topk"
    generate_completions_from_executable(bin/"topk", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/topk --version")
  end
end
