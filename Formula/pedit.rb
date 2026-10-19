class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/pedit"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "06cfed6b7ad3d551d5457630de7e4eafb5a634ea2593588badc90f934e3ad7fb" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "bf1c289175e9cbc419b7e84cc2b7d6a0638d6e95c823731963f5f7cd8f5765c0" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "62e193ffa7ff0efe6d69972ffbaa4dc297afd7adfd02d4cfd4e84420b83d6de4" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "65b774653bf55f446893e5fb516d8982e9f4fa807fcd0780453ab175fec62dc0" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
