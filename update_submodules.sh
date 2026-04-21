#!/bin/bash
set -e

echo "Updating submodules..."
git submodule update --remote --merge

# Stage primeiro, depois verifica se há algo para commitar
git add .

if ! git diff --cached --quiet; then
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