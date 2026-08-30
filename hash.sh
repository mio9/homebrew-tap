#!/bin/bash
read -rp "Version number: " version

curl -L https://github.com/mio9/notif/releases/download/v${version}/notif-darwin-arm64.tar.gz.sha256 -o -
echo ""
curl -L https://github.com/mio9/notif/releases/download/v${version}/notif-darwin-x64.tar.gz.sha256 -o -
