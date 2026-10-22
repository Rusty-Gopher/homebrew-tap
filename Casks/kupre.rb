cask "kupre" do
  version "0.6.0"

  on_macos do
    on_arm do
      sha256 "89606c08aa31ac904642588bdc6dfb8cbac7335caaf242f1b59e9c00304ff9ce"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.6.0/kupre_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "f983e153129781508a7edcec066cf1aa3f4e20b6acd99efae045074d69d42e24"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.6.0/kupre_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "ca19a789e37eb638db15c040d884a125a679345b81c7b7ffea043c57630ce6bf"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.6.0/kupre_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "81238eb254b6f4a1038ef00024f44d793112ed192b8fbac463ed6dd5b53033ae"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.6.0/kupre_linux_amd64.tar.gz"
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
