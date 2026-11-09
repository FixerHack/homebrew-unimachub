cask "unimachub" do
  version "0.10.5"
  sha256 "33f96ec8632ba0374888501220765c7023563e624936039734215e72952ac25b"

  url "https://github.com/FixerHack/MacUtil/releases/download/v#{version}/UniMacHub-#{version}.zip"
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

  app "UniMacHub.app"

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
