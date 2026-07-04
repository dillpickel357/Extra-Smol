#!/bin/bash

# -----------------------------
# Git Push Script (direct URL)
# -----------------------------

REPO_URL="https://github.com/dillpickel357/Extra-Smol.git"

if [ -z "$1" ]; then
    echo "❌ Please provide a commit message"
    echo "Usage: ./git_push.sh \"message\" [branch]"
    exit 1
fi

COMMIT_MSG="$1"
BRANCH=${2:-main}

echo "Adding files..."
git add .

echo "Committing..."
git commit -m "$COMMIT_MSG"

if [ $? -ne 0 ]; then
    echo "❌ Nothing to commit or commit failed"
    exit 1
fi

echo "Pushing to: $REPO_URL (branch: $BRANCH)"

git push "$REPO_URL" "$BRANCH"

if [ $? -eq 0 ]; then
    echo "✅ Push successful!"
else
    echo "❌ Push failed!"
fi
