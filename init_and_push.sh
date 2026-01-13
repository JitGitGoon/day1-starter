#!/usr/bin/env bash
set -euo pipefail
if [ -z "${REMOTE_URL:-}" ]; then
  echo "ERROR: Set REMOTE_URL env var. Example:"
  echo "  REMOTE_URL=git@github.com:JitGitGoon/day1-starter.git ./init_and_push.sh"
  exit 1
fi
cd "$(dirname "$0")"
if ! command -v git >/dev/null 2>&1; then
  echo "git not found. Install git and re-run."
  exit 1
fi
if [ ! -d .git ]; then
  git init
fi
git add --all
if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  git commit -m "Day1: starter files"
else
  if ! git diff --cached --quiet; then
    git commit -m "Day1: update starter files"
  fi
fi
git branch -M main || true
if git remote | grep -q '^origin$'; then git remote remove origin; fi
git remote add origin "$REMOTE_URL"
git push -u origin main
echo "Pushed starter repo to $REMOTE_URL"
