cask "kupre" do
  version "0.2.2"

  on_macos do
    on_arm do
      sha256 "1663432e299ecb3a4c6ada67e42760fc03633bad67cacd955c6e871ddd465f06"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.2.2/kupre_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "1df1557242064e07b99146f5f0e3e4bc5435335c520efa2a81121e11eab9eeeb"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.2.2/kupre_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "d4887406699b29d6515b84742f835c7831462a12e74766531521a46e5bf60ec0"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.2.2/kupre_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "80840ac18571efd75c52a8462153c8c9e68102f9e3b669c4877ce094cb846734"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.2.2/kupre_linux_amd64.tar.gz"
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
