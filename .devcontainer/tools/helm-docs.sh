#!/usr/bin/env bash

set -euo pipefail

check_semver "$TOOL_VERSION"

os=$(uname -s)
arch=$(uname -m)

curl --silent --show-error --fail --location --output /tmp/helm-docs.tar.gz https://github.com/norwoodj/helm-docs/releases/download/v"$TOOL_VERSION"/helm-docs_"$TOOL_VERSION"_"$os"_"$arch".tar.gz
helm-docs --version
