cask "peitho-studio" do
  version "0.1.9"
  sha256 "94aaeecbeefd429dacce252f1815fd0ace6e9f232c0b4fa3b467ca69ea22967c"

  url "https://github.com/piconic-ai/peitho-studio/releases/download/v#{version}/Peitho-Studio_#{version}_aarch64.dmg"
  name "Peitho Studio"
  desc "Editor for Markdown-driven Peitho presentation decks"
  homepage "https://github.com/piconic-ai/peitho-studio"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Peitho Studio.app"
end
