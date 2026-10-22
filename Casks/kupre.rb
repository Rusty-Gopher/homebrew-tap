cask "kupre" do
  version "0.5.0"

  on_macos do
    on_arm do
      sha256 "50892df108c2b7b2ab78b748e1281ea43a08f153d3d647dd7ed11cd330dc876a"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.5.0/kupre_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "52c5bcbfa80b082a21b460795d6d646156b107898d1467e871718b5c22b74443"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.5.0/kupre_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "bac6adf84f63d06de059dc44ecf27db1f7532491dd326ba05ffac587d4f3b6f0"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.5.0/kupre_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "50b71472133c14d5ec58c1cd89f614fb978296c95175f1f698bb72dd99de239d"
      url "https://github.com/Rusty-Gopher/kupre/releases/download/v0.5.0/kupre_linux_amd64.tar.gz"
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
