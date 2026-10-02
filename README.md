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
publishing the binaries. The four SHA-256
values are calculated from the published archives and checked against
`checksums.txt`.

`pedit-ci` installs the proposed Formula and runs its version test on Linux
and macOS. After both jobs succeed, `pedit-auto-merge` enables squash auto-merge
for same-repository PRs authored by `kfly8`, targeting `main`, with a
`pedit-v<VERSION>` branch. Only changes to the version and four SHA-256 values
in `Formula/pedit.rb` qualify; other changes require manual review. The merge
is tied to the tested head commit. The privileged workflow executes only the
script from `main`, never code from the PR.

Before using the automation, configure the repository:

- Enable **Allow auto-merge** and **Allow squash merging** in Settings > General.
- Protect `main` and require `pedit (ubuntu-latest)` and `pedit (macos-latest)`
  status checks. Run this PR's CI first so the check names are available.
- Allow GitHub Actions **Read and write permissions** in Settings > Actions >
  General if organization policy restricts workflow permissions.

If the release token's owner changes, update the author allowlist in
`scripts/auto-merge-pedit.py`. PRs created with a personal access token trigger
the tap's CI; PRs created with `GITHUB_TOKEN` do not trigger ordinary PR workflows.
