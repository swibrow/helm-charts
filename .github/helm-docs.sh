#!/bin/bash

mkdir -p ./.bin
export PATH="./.bin:$PATH"

set -euxo pipefail

# renovate: datasource=github-releases depName=helm-docs packageName=norwoodj/helm-docs
HELM_DOCS_VERSION=1.14.2

# Detect OS and architecture
OS=$(uname -s)
ARCH=$(uname -m)

# Map architecture names
case "${ARCH}" in
  x86_64) ARCH="x86_64" ;;
  aarch64|arm64) ARCH="arm64" ;;
  *) echo "Unsupported architecture: ${ARCH}"; exit 1 ;;
esac

# install helm-docs
curl --silent --show-error --fail --location --output /tmp/helm-docs.tar.gz \
  "https://github.com/norwoodj/helm-docs/releases/download/v${HELM_DOCS_VERSION}/helm-docs_${HELM_DOCS_VERSION}_${OS}_${ARCH}.tar.gz"
tar -C .bin/ -xf /tmp/helm-docs.tar.gz helm-docs

# validate docs
LOG=$(mktemp)
helm-docs 2>&1 | tee "$LOG"
grep 'Error generating gotemplates' "$LOG" && exit 1
git diff --exit-code
