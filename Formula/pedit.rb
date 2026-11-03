class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/pedit"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "071038e12721995d09467bdd50c07d40b4f80e93ae788533fd58c597d68be926" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "2ae9053685403b82f065b177f66e9fe46970a9ef6fc500cd884e46d54136b915" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "5b12a2588f5a98ed845030596c42e5491a57ea6d381e92c8e6159225cbad4f77" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "058c7daf6ca1677685312e18d8f10b9f264bb8500461519ff332aa8d404a49ce" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
