class Dddns < Formula
  desc "DDNS client for any DNS provider"
  homepage "https://github.com/mio9/dddns"
  license "MIT"
  version "0.3.0"

  if Hardware::CPU.arm?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_arm64.tar.gz"
    sha256 "ee2646680566c16a256978d7726a579fe51d21100ad7f6ec769e122eb345eb9a"
  elsif Hardware::CPU.intel?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_amd64.tar.gz"
    sha256 "92e4026cb25631b2c8499147132ef7a5925ff2671ca409bc41b54bf9deb51917"
  end

  def install
    bin.install "dddns"
  end

  test do
    system bin/"dddns", "--help"
  end
end
