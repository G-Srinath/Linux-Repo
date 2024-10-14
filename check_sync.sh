#!/bin/bash

# Step 1: Check the status of the local repository
echo "Checking local repository status..."
git status

# Step 2: Fetch the latest changes from the remote repository
echo "Fetching the latest changes from the remote repository..."
git fetch

# Step 3: Compare local and remote branches
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
    echo "Your local branch is up-to-date with the remote."
elif [ $LOCAL = $BASE ]; then
    echo "Your local branch is behind the remote. Pulling the latest changes..."
    git pull origin main
elif [ $REMOTE = $BASE ]; then
    echo "Your local branch is ahead of the remote. Pushing your local changes..."
    git push origin main
else
    echo "Your local and remote branches have diverged. Manual intervention required."
fi
