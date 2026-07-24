#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip -o dartsdk.zip
unzip -q dartsdk.zip
export PATH="$PWD/dart-sdk/bin:$HOME/.pub-cache/bin:$PATH"

dart pub get
dart pub global activate jaspr_cli
jaspr build
