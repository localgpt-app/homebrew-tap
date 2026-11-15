# The LocalGPT tap

[LocalGPT](https://localgpt.app) through Homebrew.

```bash
brew install localgpt-app/tap/localgpt   # the localgpt command line, on macOS and Linux
```

`Formula/localgpt.rb` installs `localgpt`, the command line for `.world`
packages and the MCP server over an open world, prebuilt: the binary the
[`localgpt` npm package](https://www.npmjs.com/package/localgpt) carries for
the computer it is on, so it is the build that package's release installed
and ran on each platform. It comes with completions for bash, zsh and fish,
and needs no Node.

Nothing here is written by hand. The formula is rendered by `cargo xtask
formula` in [localgpt-app/localgpt](https://github.com/localgpt-app/localgpt),
and `.github/workflows/update.yml` fetches it: every hour it asks npm what
`latest` is, and when the formula is behind, it renders that version's at the
release's tag, installs it, runs its test and commits it. To have it now:

```bash
gh workflow run update.yml -R localgpt-app/homebrew-tap
```

A cask for `LocalGPT.app`, the desktop app, goes in `Casks/` with a desktop
release.
