class Topk < Formula
  desc "Turn raw files into searchable knowledge"
  homepage "https://topk.io"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-apple-darwin.tar.gz"
      sha256 "2ddb2e68882e38baff23246299dfd2d6eaeaf11efa77d0460fc564bb55f0d172"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-apple-darwin.tar.gz"
      sha256 "484fecd713df76481e43a92533e64cea0cc3271db0666a721df3d9c405ce47be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e71f7b22a5db90cdbc5cc47ddd53006a2b58b1128a8f44bcc0ccc6ed9982c59"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c085008a15f691ccf1b3f75a088eb85ca83743baff774bc15aadabbda573cfe3"
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
