cask "peitho-studio" do
  version "0.1.10"
  sha256 "e5f83966157760a005d69e1b822942eb53c10211e8d113096313e61aae00ffa6"

  url "https://github.com/piconic-ai/peitho-studio/releases/download/v#{version}/Peitho-Studio_#{version}_aarch64.dmg"
  name "Peitho Studio"
  desc "Editor for Markdown-driven Peitho presentation decks"
  homepage "https://github.com/piconic-ai/peitho-studio"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Peitho Studio.app"
end
