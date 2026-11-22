# cs-tungthanh/tap

Homebrew casks for my apps.

## Nook

Menu bar utilities for macOS: Pomodoro, power-off timer, screen recording, music and more. See [cs-tungthanh/nook](https://github.com/cs-tungthanh/nook).

```bash
brew tap cs-tungthanh/tap
brew trust cs-tungthanh/tap
brew install nook
```

`brew trust` lets Homebrew install from this tap; Homebrew asks this once for any tap outside its own. Update with `brew upgrade nook`, remove with `brew uninstall nook`.

`Casks/nook.rb` is updated automatically by Nook's release workflow; don't edit it by hand.
