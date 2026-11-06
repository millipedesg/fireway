#!/usr/bin/env bash
set -euo pipefail
PROJECT_ID="${1:?project id}"
REGION="${2:-asia-southeast1}"
REPO_ID="${3:-millipedesg-npm}"
REGISTRY="https://${REGION}-npm.pkg.dev/${PROJECT_ID}/${REPO_ID}/"
AUTH_HOST="//${REGION}-npm.pkg.dev/${PROJECT_ID}/${REPO_ID}/:always-auth=true"
OUT="${NPMRC_PATH:-.npmrc}"
{
  printf '@millipedesg:registry=%s\n' "$REGISTRY"
  printf '%s\n' "$AUTH_HOST"
} > "$OUT"
