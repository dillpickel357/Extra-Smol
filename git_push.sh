#!/bin/bash

# -----------------------------
# Git Push Script
# -----------------------------

# Change this if your default branch is different
BRANCH=${2:-main}

# Check for a commit message
if [ -z "$1" ]; then
    echo "❌ Usage: ./git_push.sh \"Commit message\" [branch]"
    exit 1
fi

COMMIT_MSG="$1"

# Make sure we're inside a Git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "❌ Error: This is not a Git repository."
    exit 1
fi

echo "📂 Adding files..."
git add .

# Check if there are staged changes
if git diff --cached --quiet; then
    echo "ℹ️ No changes to commit."
else
    echo "📝 Creating commit..."
    git commit -m "$COMMIT_MSG"

    if [ $? -ne 0 ]; then
        echo "❌ Commit failed."
        exit 1
    fi
fi

echo "🚀 Pushing to origin/$BRANCH..."
git push origin "$BRANCH"

if [ $? -eq 0 ]; then
    echo "✅ Push successful!"
else
    echo "❌ Push failed."
    exit 1
fi
