cask "nook" do
  version "1.0.0"
  sha256 "bd5419a425bc07cfc5918e6caf46ed3fcd91a47d49071c32582f4795886f5dbe"

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
