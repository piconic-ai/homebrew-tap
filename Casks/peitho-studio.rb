cask "peitho-studio" do
  version "0.1.2"
  sha256 "3cfdb104a00b1f3df037d7681b5b5ed83fc3f3ea0b3ffc69cbe05c39b60293bb"

  url "https://github.com/piconic-ai/peitho-studio/releases/download/v#{version}/Peitho-Studio_#{version}_aarch64.dmg"
  name "Peitho Studio"
  desc "Editor for Markdown-driven Peitho presentation decks"
  homepage "https://github.com/piconic-ai/peitho-studio"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Peitho Studio.app"
end
