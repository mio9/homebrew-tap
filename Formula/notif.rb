# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
class Notif < Formula
  desc "Notify on command line."
  homepage "https://github.com/mio9/notif"
  license "MIT"
  version "0.1.3"

  if Hardware::CPU.arm?
    url "https://github.com/mio9/notif/releases/download/v#{version}/notif-darwin-arm64.tar.gz"
    sha256 "e8bcfdc567aef6463ca7883ff02fc53fe9d26719f730aaf9c5c242f7e9f31059"
  elsif Hardware::CPU.intel?
    url "https://github.com/mio9/notif/releases/download/v#{version}/notif-darwin-x64.tar.gz"
    sha256 "c7878af00890384321f662e0bdeb3ec25a0250c26f6a079d766dc1b5542bd922"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "notif-darwin-arm64" => "notif"
    elsif Hardware::CPU.intel?
      bin.install "notif-darwin-x64" => "notif"
    end
  end

  test do
    system bin/"notif", "--help"
  end
end
