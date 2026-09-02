class Dddns < Formula
  desc "DDNS client for any DNS provider"
  homepage "https://github.com/mio9/dddns"
  license "MIT"
  version "0.2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_arm64.tar.gz"
    sha256 "5c570a883c712bbd18bd20bd409135848685f17e852d2fc56180244cb48665bb"
  elsif Hardware::CPU.intel?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_amd64.tar.gz"
    sha256 "6af3fa3346b2ba0cd0d901dbfb6881e4fd5f3806df6bea52eb5cf38fa3ae9fc4"
  end

  def install
    bin.install "dddns"
  end

  test do
    system bin/"dddns", "--help"
  end
end
