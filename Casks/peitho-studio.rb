cask "peitho-studio" do
  version "0.1.13"
  sha256 "0e7249e3c11d373bead21af59916a25e25e370fac0076264dda4fde7036528f5"

  url "https://github.com/piconic-ai/peitho-studio/releases/download/v#{version}/Peitho-Studio_#{version}_aarch64.dmg"
  name "Peitho Studio"
  desc "Editor for Markdown-driven Peitho presentation decks"
  homepage "https://github.com/piconic-ai/peitho-studio"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Peitho Studio.app"
end
