class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/pedit"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "a90417ee9b24a633dd50e0ec387390c31901cb0b42644d3df6e859aeafe97881" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "3fd101d2a59f5aebcb857cc7c9f224d41ae5f5c7b487043a666415a4f0172258" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "0e185fc7b34062dbd41910bdee1e8e4ae94c75951d0c7f6de9cc110599b74569" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "415c929d598aeae527a0637712de5244a2a73c55d0046826f3a2aa61ac9c3b58" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
