class Notif < Formula
  desc "Notify on command-line"
  homepage "https://github.com/mio9/notif"
  version "0.1.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/mio9/notif/releases/download/v#{version}/notif-darwin-arm64.tar.gz"
    sha256 "b5f93a0a80cd8846fcf4f6af3f87bd8425b086aa133db23f0bc0bbff0671b987"
  elsif Hardware::CPU.intel?
    url "https://github.com/mio9/notif/releases/download/v#{version}/notif-darwin-x64.tar.gz"
    sha256 "0fd8d2d2295ab9c2793207c44daf1c8e4fb42b7fad65e666301b37ad1cfc568b"
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
