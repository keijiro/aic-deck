#!/usr/bin/env bash
# Build the deck and deploy it to GitHub Pages (keijiro/aic-deck-web).
#
# Usage: pnpm deploy:web [commit message]
#
# The deploy repository is used from $DEPLOY_DIR (default: ./aic-deck-web),
# cloned there if missing. "*-hq.mp4" files are never overwritten or deleted:
# the deploy repository holds size-reduced versions of them to stay within
# GitHub's file size limit. ".nojekyll" is also kept as-is.
set -euo pipefail

REPO_URL="git@github.com:keijiro/aic-deck-web.git"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEPLOY_DIR="${DEPLOY_DIR:-$ROOT/aic-deck-web}"
SRC_REV="$(git -C "$ROOT" rev-parse --short HEAD)"
MESSAGE="${1:-Deploy $SRC_REV}"

if [ -n "$(git -C "$ROOT" status --porcelain)" ]; then
  echo "warning: aic-deck has uncommitted changes; deploying the working tree." >&2
fi

# Prepare the deploy repository.
if [ ! -d "$DEPLOY_DIR/.git" ]; then
  git clone "$REPO_URL" "$DEPLOY_DIR"
fi
if [ -n "$(git -C "$DEPLOY_DIR" status --porcelain)" ]; then
  echo "error: $DEPLOY_DIR has uncommitted changes; aborting." >&2
  exit 1
fi
git -C "$DEPLOY_DIR" pull --ff-only

# Build.
cd "$ROOT"
pnpm build

# Sync the build output. Excluded paths are neither copied nor deleted.
rsync -a --delete \
  --exclude '.git' \
  --exclude '.nojekyll' \
  --exclude '.gitignore' \
  --exclude '.DS_Store' \
  --exclude '*-hq.mp4' \
  "$ROOT/dist/" "$DEPLOY_DIR/"

# Commit and push.
cd "$DEPLOY_DIR"
git add -A
if git diff --cached --quiet; then
  echo "No changes to deploy."
  exit 0
fi
git diff --cached --stat | tail -n 1
git commit -q -m "$MESSAGE"
git push
echo "Deployed $SRC_REV. GitHub Pages will update shortly."
