class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/edit"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "897a5e34696654acd8067a6098227f4b2252508e5980d1b559209f205736bbdc" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "59181ab1ae71d225aac094f48e7eda467741a53a380e57565b5b90585f78c55d" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "46cb0162bc5d00b5804e398067c2af0d4e9f9f091f49285c2ca16a5f411e531f" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/edit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "35a5b8c1a2d0a76f44d2420dbf0c263e5a7594b99acaf8ca37541c163ad0587a" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
