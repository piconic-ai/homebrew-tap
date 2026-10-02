class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/edit"
  version "0.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "c9bd918fc582852c13e0e3ad5343b96aa646d4cbe95e1674766a274e33a675e1" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "7c5414f2623f72bac73706cd0578860bb42ddff666bc474df01a6004fb96e6ad" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "8f1ecc9816c2ae902c4215db36f9fa64ec94e5edddb06fb6c5104003df495e1c" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "d27e5d619a6b6fdfc78e9710edd8ddc391e113cc8b4501358e8de7931e83b5bf" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
