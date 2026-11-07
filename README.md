# Homebrew tap for UniMacHub

[UniMacHub](https://github.com/FixerHack/MacUtil) (formerly MacUtil) is a free, open-source
control centre for the Mac: cleaning, storage, apps, system tuning and security.

```bash
brew tap fixerhack/unimachub
brew trust fixerhack/unimachub
brew install --cask unimachub
```

Homebrew loads casks from a tap outside its own only after `brew trust`.

Update with `brew upgrade unimachub`, remove with `brew uninstall unimachub`
(add `--zap` to also delete its settings and history).

Installed as `macutil` before the rename? `brew upgrade` carries it over to the new name.

The app is not notarized by Apple. See
[First launch](https://github.com/FixerHack/MacUtil#first-launch) for the one extra step.
