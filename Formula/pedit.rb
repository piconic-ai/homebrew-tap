class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/pedit"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "9a444ae5dbc0d96ba6763393864f94d13b320720878e51eefa2091b607cf81dd" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "caada95f443f99b4ac3853cb6193ca8c35f577a2ef80d548436a248dcb8042db" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "c19855d74cba6b2dba79d69fd71aa5cc3de07c35ab06386d91d9c64c0e1c3c71" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "e6619a07473480979baff7a5d18f4ebb62286ad0b900652e948ed34459122bc6" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
