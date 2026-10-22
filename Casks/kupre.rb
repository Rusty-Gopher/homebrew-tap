cask "kupre" do
  version "0.5.1"

  on_macos do
    on_arm do
      sha256 "f1fbf884b91902e5fec6b2a94c5d5c95b18da222556e7dde0d6f83a0b319e006"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.5.1/kupre_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "001cb44bc23ec157bfa8ae226fe04fcfbc9bca53446e612fe7c76a8c021971dc"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.5.1/kupre_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "cce427fef171bb9260eb6a178106f8b989753299b54c9efd48dc0ee524232a9f"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.5.1/kupre_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "93b4e0f682f7585fa0d3ba1f5fc02b76cb0151eb4508b2f1b6b1dbf3a0b15f63"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.5.1/kupre_linux_amd64.tar.gz"
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
