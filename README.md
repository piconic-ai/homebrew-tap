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

## pedit

Pair edit your local files in the browser. Supports macOS and Linux on Intel
and ARM64, using the published binaries from [pedit](https://github.com/piconic-ai/edit).

```sh
brew install piconic-ai/tap/pedit
brew upgrade piconic-ai/tap/pedit
```

The upstream release workflow opens a PR updating `Formula/pedit.rb` after
publishing the binaries. Review and merge these PRs manually. The four SHA-256
values are calculated from the published archives and checked against
`checksums.txt`.
