#!/usr/bin/env bash
set -euo pipefail

VERSION="${1#v}"
FORMULA="Formula/dddns.rb"
BASE_URL="https://github.com/mio9/dddns/releases/download/v${VERSION}"
CHECKSUMS_URL="${BASE_URL}/SHA256SUMS"

echo "Updating dddns to ${VERSION}"

ARM64_SHA="$(curl -fsSL "${CHECKSUMS_URL}" | awk "/dddns_v${VERSION}_darwin_arm64.tar.gz/ {print \$1}")"
AMD64_SHA="$(curl -fsSL "${CHECKSUMS_URL}" | awk "/dddns_v${VERSION}_darwin_amd64.tar.gz/ {print \$1}")"

if [[ -z "${ARM64_SHA}" || -z "${AMD64_SHA}" ]]; then
  echo "Failed to fetch checksums for dddns ${VERSION}" >&2
  exit 1
fi

cat >"${FORMULA}" <<EOF
class Dddns < Formula
  desc "DDNS client for any DNS provider"
  homepage "https://github.com/mio9/dddns"
  license "MIT"
  version "${VERSION}"

  if Hardware::CPU.arm?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_arm64.tar.gz"
    sha256 "${ARM64_SHA}"
  elsif Hardware::CPU.intel?
    url "https://github.com/mio9/dddns/releases/download/v#{version}/dddns_v#{version}_darwin_amd64.tar.gz"
    sha256 "${AMD64_SHA}"
  end

  def install
    bin.install "dddns"
  end

  test do
    system bin/"dddns", "--help"
  end
end
EOF
