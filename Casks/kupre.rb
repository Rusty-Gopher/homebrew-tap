cask "kupre" do
  version "0.3.0"

  on_macos do
    on_arm do
      sha256 "00f3324ad443aa3986a2380e90294e66db8419f1f06eba0f062f47819478b0d7"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.3.0/kupre_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "358a288c29ecff3148996a2ef87807e65ac3c059fc7834f8e7e1e9aaa916a8a1"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.3.0/kupre_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "29e725189def5624bb80127eec34c0951d9ed60e3ae24109e405633ace94d448"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.3.0/kupre_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "f76a6bbc28bdb490724a886c297453fb66184f4f802f59ff8e1dbb1e5885de7d"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.3.0/kupre_linux_amd64.tar.gz"
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
