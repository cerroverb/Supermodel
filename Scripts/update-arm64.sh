#!/bin/bash
# Update this 64-bit ARM Linux build from the latest release. Only program files are
# replaced: Config/Supermodel.ini, NVRAM and Saves are not in the archive.
set -e
cd "$(dirname "$0")"
API=https://api.github.com/repos/cerroverb/Supermodel/releases/latest
URL=$(curl -fsS --max-time 15 "$API" | grep -o 'https://[^"]*supermodel-arm64.tar.gz')
TMP=$(mktemp)
trap 'rm -f "$TMP"' EXIT
curl -fsSL --max-time 120 -o "$TMP" "$URL"
tar -tzf "$TMP" > /dev/null
tar -xzf "$TMP" --strip-components=1
echo "Updated from $URL"
