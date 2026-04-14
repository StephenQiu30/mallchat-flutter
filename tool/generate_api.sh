#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

cd "$ROOT_DIR"

echo "==> Generating API clients from swagger_parser.yaml"
dart run swagger_parser -f swagger_parser.yaml

echo "==> Generating serializers and retrofit files"
dart run build_runner build --delete-conflicting-outputs

echo "==> API generation completed"
