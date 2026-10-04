class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/edit"
  version "0.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "847fd21eea9bd8468d6595250787b089829038fb7b265aca8cf00e623befaebc" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "7b0a9dbcd9d753c418e06f1b648141d140a6786169a343a4d7a6a29cd0c62ad4" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "b2d9cdee31976608b9ca877bc5e6dfd9909c298b15356ee71799b2d34ede2a86" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "7f2a3c015d6e7886f866de9bd486fe54c8e794723e74d2aa5a1c93d590a3eb5e" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
