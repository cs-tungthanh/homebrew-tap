cask "nook" do
  version "1.6.1"
  sha256 "4cc87e36a11cc3ffa2feb0e3a3ef294374ab34a6ea548c9af29e965bde94885e"

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
