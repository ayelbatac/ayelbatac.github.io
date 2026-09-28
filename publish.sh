#!/bin/bash
set -e

trap 'echo "❌ Script stopped because a command failed. Check the error above." >&2' ERR

echo "Rendering site..."
quarto render

echo "Adding changes..."
git add .

# Check for staged changes; distinguish them from a Git error.
staged_status=0
git diff --cached --quiet || staged_status=$?

case "$staged_status" in
  0)
    echo "No new changes to commit. Continuing to push..."
    ;;
  1)
    read -r -p "Enter commit message: " msg
    git commit -m "$msg"
    ;;
  *)
    echo "❌ Could not check staged changes. Script stopped." >&2
    exit "$staged_status"
    ;;
esac

echo "Pushing to GitHub..."
git push origin main

echo "✅ Site rendered and pushed to GitHub."
echo "Opening site in browser..."
open "https://ayelbatac.github.io/"

echo "✅ Done: site rendered, pushed, and browser opened."