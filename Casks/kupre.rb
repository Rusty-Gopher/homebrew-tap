cask "kupre" do
  version "0.4.0"

  on_macos do
    on_arm do
      sha256 "a80dccecfa5626786fbbb979450f99149ab9838390ad264a154d7957fd1ebf37"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.4.0/kupre_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "19a77d59319a1af4c00b57f18381359650ac9504971b9e38f39e2022537189c7"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.4.0/kupre_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "62492837edc1a89ef9143ea38134a29ef8cb78c16d32a7a00feb342eb6f7e019"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.4.0/kupre_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "7116667912596f78eed32ed2b60e4c3f3fb9e0fcec76f12a4d02ecec44aec612"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.4.0/kupre_linux_amd64.tar.gz"
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
