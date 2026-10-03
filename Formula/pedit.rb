class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/edit"
  version "0.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "a3313d8cdc9d4af5330849751631db75960406db348de5a86b12060c6dcfb59b" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "c82b8c7de4e11776eaac93b7325753df9480f2fcf9987e9239f631c73d652bc0" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "814260f680843f882846e5007052604b56a686a73cd7c28a5143043321d54aa8" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "f50257623fdeed0982715b0935b4b40ecc78287e0eca9ab5aa8d88a41aaf0221" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
