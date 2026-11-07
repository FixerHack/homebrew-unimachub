cask "unimachub" do
  version "0.9.0"
  sha256 "af4cbbd0b2eb2b012c850d4e7ed634af58120a1b0d0402946803f32815f1a967"

  url "https://github.com/FixerHack/MacUtil/releases/download/v#{version}/MacUtil-#{version}.zip"
  name "UniMacHub"
  desc "Control centre for cleaning, storage, apps, system tuning and security"
  homepage "https://github.com/FixerHack/MacUtil"

  livecheck do
    url :url
    strategy :github_latest
  end

  # UniMacHub updates itself from its GitHub releases.
  auto_updates true
  depends_on macos: :sonoma

  # 0.9.0 was the last release under the old name. Installing it under the new one means
  # its built-in updater looks for UniMacHub.app in the next release, which is what is there.
  app "MacUtil.app", target: "UniMacHub.app"

  zap trash: [
    "~/Library/Application Support/MacUtil",
    "~/Library/Application Support/UniMacHub",
    "~/Library/Caches/com.fixerhack.MacUtil",
    "~/Library/HTTPStorages/com.fixerhack.MacUtil",
    "~/Library/HTTPStorages/com.fixerhack.MacUtil.binarycookies",
    "~/Library/Preferences/com.fixerhack.MacUtil.plist",
  ]

  caveats <<~EOS
    UniMacHub is not notarized by Apple, so macOS blocks the first launch.
    Later updates install themselves from inside UniMacHub, without this step.
    Open it once, then: System Settings → Privacy & Security → Open Anyway.
    Or run:
      xattr -dr com.apple.quarantine #{appdir}/UniMacHub.app

    UniMacHub не нотаризований Apple, тому macOS блокує перший запуск.
    Відкрийте його один раз, потім: Системні параметри → Приватність і безпека → Все одно відкрити.

    On first launch UniMacHub shows how to grant Full Disk Access.
  EOS
end
