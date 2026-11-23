cask "nook" do
  version "1.6.0"
  sha256 "35b585974fb3c72fb1d7c3b4b1a45f001a8e884c1565aa9d02f754f807490053"

  url "https://github.com/cs-tungthanh/nook/releases/download/v#{version}/Nook-#{version}.zip"
  name "Nook"
  desc "Menu bar utilities: Pomodoro, power-off timer, screen recording and more"
  homepage "https://github.com/cs-tungthanh/nook"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Nook.app"

  # Nook isn't notarized, so Gatekeeper would refuse to open the downloaded
  # copy. Clear the quarantine flag that Homebrew sets on download.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Nook.app"],
        writable_paths: ["Nook.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.nook.app"

  zap trash: "~/Library/Preferences/com.nook.app.plist"
end
