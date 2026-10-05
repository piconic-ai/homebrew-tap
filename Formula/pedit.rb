class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/edit"
  version "0.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "7e8c6a047ad372eb18bc1c5430774104d2d76be210a96514bf914f67c9da288a" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "0bbeee51a23695e0cd9950dd9c862d5241bcd0f63b3fa15ea5edecce4ee6a060" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "f03f5687810934788d4a19effad3a32949c3071bff97497752ee235497c9476c" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "ad6c379938a407de5acc970aad26369d0cea67d1b7630055f9b1065d5bab69b5" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
