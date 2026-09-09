class Dddns < Formula
  desc "DDNS client for any DNS provider"
  homepage "https://github.com/mio9/dddns"
  license "MIT"
  version "0.3.1"

  if Hardware::CPU.arm?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_arm64.tar.gz"
    sha256 "e0a943e49ba5e2d210adc0583434034494e1653889c28746707117a6378ed053"
  elsif Hardware::CPU.intel?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_amd64.tar.gz"
    sha256 "797bad582a75a681be5967f52057001c979885ec0c18232daa13226858e06d37"
  end

  def install
    bin.install "dddns"
  end

  test do
    system bin/"dddns", "--help"
  end
end
