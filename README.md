# Piconic Homebrew Tap

## Peitho Studio

Install the desktop editor for [Peitho](https://github.com/mizzy/peitho) decks:

```sh
brew install --cask piconic-ai/tap/peitho-studio
```

Requires Apple Silicon and macOS 13 (Ventura) or later. The current cask
installs the `0.1.0-rc.7` prerelease from the signed and notarized upstream DMG.

Upgrade with:

```sh
brew update
brew upgrade --cask --greedy piconic-ai/tap/peitho-studio
```

`--greedy` includes this cask because Peitho Studio also supports in-app updates.

## Maintaining the cask

For each release, update `version` and `sha256` in `Casks/peitho-studio.rb`.
Use the SHA-256 of `Peitho-Studio_<version>_aarch64.dmg`, not the updater archive.
The release asset's `digest` field is available with:

```sh
gh release view v<VERSION> --repo piconic-ai/peitho-studio --json assets
```

Alternatively, download the DMG and calculate its checksum with
`shasum -a 256 <path-to-dmg>`.
