#!/bin/bash

# -----------------------------
# Git Pull Script (direct URL)
# -----------------------------

REPO_URL="https://github.com/dillpickel357/Extra-Smol.git"

BRANCH=${1:-main}

echo "Pulling from: $REPO_URL (branch: $BRANCH)"

git pull "$REPO_URL" "$BRANCH"

if [ $? -eq 0 ]; then
    echo "✅ Pull successful!"
else
    echo "❌ Pull failed!"
fi
