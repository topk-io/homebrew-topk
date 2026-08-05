class Topk < Formula
  desc "Turn raw files into searchable knowledge"
  homepage "https://topk.io"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-apple-darwin.tar.gz"
      sha256 "35573ec7308d18a9748219d8eefc926b8d49e2d39141d747bad0fc0887912126"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-apple-darwin.tar.gz"
      sha256 "400d0a81b6461ffa70059cfb9dbcda689e9e78af577255b72b70ffa5527e1126"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e118a5b36f85a1ffe7bcc2ea954e6ce25928c898e34815da94d05560b92b240c"
    else
      url "https://github.com/topk-io/topk/releases/download/cli-v#{version}/topk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cac31cedb19a75cffe686aa6c36896e22000ad04149a27664f6641b453e07767"
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
