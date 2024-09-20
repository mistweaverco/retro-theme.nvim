#!/usr/bin/env bash

set -euo pipefail

gh release create --generate-notes "v$VERSION"
