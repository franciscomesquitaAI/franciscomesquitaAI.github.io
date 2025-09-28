#!/bin/bash
set -e  # stop on error

# ... your other commands ...

# Commit and push if there are changes
if ! git diff --quiet --submodule=log; then
  git add .
  git commit -m "update submodule"
  
  echo "Pushing to remote..."
  if ! git push; then
    echo "❌ Git push failed! Check your credentials or remote permissions."
    read -r -p "Press Enter to exit."
    exit 1
  fi
else
  echo "No changes to commit."
fi

echo "✅ Done. Press Enter to exit."
read -r _