#!binbash

# Set your GitHub username and repository name
USERNAME=your_username
REPO=your_repository

# Set the branch you want to push
BRANCH=main

# Check if a commit message is provided as an argument
if [ -z $1 ]; then
  echo Usage $0 commit_message
  exit 1
fi

# Use the provided commit message
COMMIT_MESSAGE=$1

# Add and commit changes
git add .
git commit -m $COMMIT_MESSAGE

# Push changes to GitHub
git push origin $BRANCH

# Check if the push was successful
if [ $ -eq 0 ]; then
  echo Code pushed successfully to GitHub
else
  echo Error Failed to push code to GitHub
fi
