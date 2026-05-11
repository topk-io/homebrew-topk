class Topk < Formula
  desc "Turn raw files into searchable knowledge"
  homepage "https://topk.io"
  version "0.9.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-apple-darwin.tar.gz"
      sha256 "b47807ca662aab5ac37d6985d586e82f4e93ad6dcc594bc6e8374319f2e55654"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-apple-darwin.tar.gz"
      sha256 "8da56f82f0b105ebd80ebac9ce1cdf37ca21e02f7746a3dd747ad305de03f749"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72a66d72c60f544bc6ea08b4d83b5650c5de2074b9e6f422fb88cb6feee06b03"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f1ba4ae4a095e3e956141f00d05fd276e3a8b7a75e71db55435e9afcb433473"
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
