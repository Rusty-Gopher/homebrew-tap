cask "kupre" do
  version "0.6.1"

  on_macos do
    on_arm do
      sha256 "8d748e8cb981fba085c1e0471df3ae3af20ede906714569d365c441095316f00"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.6.1/kupre_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "3b4de51d6e5a043c4200d867deb1c3aa6d4be9222d910d0a4a855400655aeb63"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.6.1/kupre_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "37e55a218968b0a29b9ff277388dabd4fbe6894c16a939f4f3c0ce857a8825f9"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.6.1/kupre_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "e95b9916260ce46e6b2c12fc55c5c60c8b2693025a04c89031fa7dbef24af958"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.6.1/kupre_linux_amd64.tar.gz"
    end
  end

  name "kupre"
  desc "Kubernetes upgrade preflight, health check and certificate audit"
  homepage "https://github.com/Rusty-Gopher/kupre"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "kupre"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/kupre"]
    end
  end
end
