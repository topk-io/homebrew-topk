class Topk < Formula
  desc "Turn raw files into searchable knowledge"
  homepage "https://topk.io"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-apple-darwin.tar.gz"
      sha256 "6b21111882365270991226a149857e0c413be79ab4f24be09b89b9887567b5b3"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-apple-darwin.tar.gz"
      sha256 "ab905b431d3edda649b63fba86ea3e998ff0099ae3f1699ce466c3f71b9da0f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b23f54f252f733a4e544e12ff6ecc157022410d2663450f203cea7b755b53552"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8ee21b4fc832cddb21d21d410bae18d668542daf15a71f6b3a996496d3efaea"
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
