cask "peitho-studio" do
  version "0.1.3"
  sha256 "2ffbb6e7cb5b2381b6763b937ce67d26abf481a5ea0fcdb2e282125f217b8eab"

  url "https://github.com/piconic-ai/peitho-studio/releases/download/v#{version}/Peitho-Studio_#{version}_aarch64.dmg"
  name "Peitho Studio"
  desc "Editor for Markdown-driven Peitho presentation decks"
  homepage "https://github.com/piconic-ai/peitho-studio"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Peitho Studio.app"
end
