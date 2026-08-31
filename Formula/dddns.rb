# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
class Dddns < Formula
  desc "DDNS client for any DNS provider"
  homepage "https://github.com/mio9/dddns"
  license "MIT"
  version "0.1.0"

  if Hardware::CPU.arm?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_arm64.tar.gz"
    sha256 "1fa7bb9d2121c2a13eefa40d14e693ecbaf3b74ef6258c41320c77de94334d10"
  elsif Hardware::CPU.intel?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_amd64.tar.gz"
    sha256 "fa1100d0f4fb4f1989b638354b83085b539e9b21248d9bda0ac8889e8255be3a"
  end

  def install
    bin.install "dddns"
  end

  test do
    system bin/"dddns", "--help"
  end
end
