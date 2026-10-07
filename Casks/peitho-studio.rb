cask "peitho-studio" do
  version "0.1.5"
  sha256 "56840982bc9045198dd4c7f03cb47359cede3d00969ebf4093d894750f0a5117"

  url "https://github.com/piconic-ai/peitho-studio/releases/download/v#{version}/Peitho-Studio_#{version}_aarch64.dmg"
  name "Peitho Studio"
  desc "Editor for Markdown-driven Peitho presentation decks"
  homepage "https://github.com/piconic-ai/peitho-studio"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Peitho Studio.app"
end
