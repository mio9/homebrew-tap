#!/usr/bin/env bash
set -euo pipefail

VERSION="${1#v}"
FORMULA="Formula/notif.rb"
BASE_URL="https://github.com/mio9/notif/releases/download/v${VERSION}"

echo "Updating notif to ${VERSION}"

ARM64_SHA="$(curl -fsSL "${BASE_URL}/notif-darwin-arm64.tar.gz.sha256" | awk '{print $1}')"
X64_SHA="$(curl -fsSL "${BASE_URL}/notif-darwin-x64.tar.gz.sha256" | awk '{print $1}')"

if [[ -z "${ARM64_SHA}" || -z "${X64_SHA}" ]]; then
  echo "Failed to fetch checksums for notif ${VERSION}" >&2
  exit 1
fi

cat >"${FORMULA}" <<EOF
class Notif < Formula
  desc "Notify on command-line"
  homepage "https://github.com/mio9/notif"
  version "${VERSION}"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/mio9/notif/releases/download/v#{version}/notif-darwin-arm64.tar.gz"
    sha256 "${ARM64_SHA}"
  elsif Hardware::CPU.intel?
    url "https://github.com/mio9/notif/releases/download/v#{version}/notif-darwin-x64.tar.gz"
    sha256 "${X64_SHA}"
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
EOF
