class Pedit < Formula
  desc "Pair edit your local files in the browser"
  homepage "https://github.com/piconic-ai/pedit"
  version "0.1.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_arm64.tar.gz"
      sha256 "03e0e6571e0461f4a17a7cd5e5e6b27a75c96483e75f7ac24ccf37d58f4bd58c" # darwin/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_darwin_amd64.tar.gz"
      sha256 "6fbe401e454600ccd8878b92d25e14452c11c91ab3db5f1b9f0fc25de37947c3" # darwin/amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_arm64.tar.gz"
      sha256 "49f43d120042ab9f81388db0f7e9a14a6399b41d1323f8be6654a8c11cd03aa4" # linux/arm64
    end
    on_intel do
      url "https://github.com/piconic-ai/pedit/releases/download/v#{version}/pedit_v#{version}_linux_amd64.tar.gz"
      sha256 "d1e8c35948c0d0aa773b7ffae2fb71fe672516bb0c7a71a55ec0c61cdad9d73d" # linux/amd64
    end
  end

  def install
    bin.install "pedit"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/pedit --version").strip
  end
end
