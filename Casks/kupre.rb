cask "kupre" do
  version "0.2.1"

  on_macos do
    on_arm do
      sha256 "bd02649fdb902ab04b19d8c9dd72ba25097cbb2e96e1f362087f0ffd8efbfca1"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.2.1/kupre_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "d0ada7f9df7981035104eb66d0514a0e4e92e5ca69ea2f42055ebd039453b574"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.2.1/kupre_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "5e44cbae18878e664b1546f6568819eddc036eb0a9b6a815026d02c90baf9800"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.2.1/kupre_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "f3f1628f5495f9a5b2fd1341a16dc24ce45bba338e022ea0cd76fa1286a9dde6"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.2.1/kupre_linux_amd64.tar.gz"
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
