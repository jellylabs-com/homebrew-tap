cask "orphanedwindowninja" do
  version "1.0.0"
  sha256 "f8a1fb8d28800510245578914bf907b34b0859495bdd01c9aba7578d130709f5"
  url "https://github.com/jellylabs-com/OrphanedWindowNinja/releases/download/v#{version}/OrphanedWindowNinja.zip"
  name "OrphanedWindowNinja"
  desc "macOS utility that finds and closes orphaned windows"
  homepage "https://github.com/jellylabs-com/OrphanedWindowNinja"
  app "OrphanedWindowNinja.app"
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/OrphanedWindowNinja.app"], sudo: false
  end
end
