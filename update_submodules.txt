#!/bin/bash
set -e  # stop on error

# Update submodules
git submodule update --init --recursive
git submodule update --remote --merge

# Go into submodule, fetch latest
cd _posts/Learning_Notes
git fetch
cd ../..

# Commit and push if there are changes
if ! git diff --quiet || ! git diff --cached --quiet; then
  git add .
  git commit -m "update submodule"
  git push
else
  echo "No changes to commit."
fi

echo "Done. Press Enter to exit."
read