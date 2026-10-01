cask "peitho-studio" do
  version "0.1.0-rc.7"
  sha256 "5aef2cf658b78eac0a27be8bf26e151dcee866ced4bf08606ef54e6d3699342f"

  url "https://github.com/piconic-ai/peitho-studio/releases/download/v#{version}/Peitho-Studio_#{version}_aarch64.dmg"
  name "Peitho Studio"
  desc "Editor for Markdown-driven Peitho presentation decks"
  homepage "https://github.com/piconic-ai/peitho-studio"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Peitho Studio.app"
end
