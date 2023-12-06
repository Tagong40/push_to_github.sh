#!/bin/bash

# Check if running locally or on GitLab CI/CD
if [ "$CI" == "true" ] || [ "$LOCAL" == "true" ]; then
    # Set local API URL
    API_URL="http://127.0.0.1:8000/api/v1/"
else
    # Set production API URL
    API_URL="https://er.glofacts.com/api/v1/"
fi

# Replace the placeholder in the JavaScript file with the determined API_URL
sed -i "s|const API_URL = \"http://127.0.0.1:8000/api/v1/\";|const API_URL = \"${API_URL}\";|g" src/store/axios.tsx




# Check if a commit message is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <commit_message>"
  exit 1
fi

# Use the provided commit message
COMMIT_MESSAGE="$1"

# Add and commit changes
git add .
git commit -m "$COMMIT_MESSAGE"

# Push changes to GitHub
git push origin $BRANCH

# Check if the push was successful
if [ $? -eq 0 ]; then
  echo "Code pushed successfully to GitHub"
else
  echo "Error: Failed to push code to GitHub"
fi

API_URL_LOCAL="http://127.0.0.1:8000/api/v1/"


sed -i "s|const API_URL = \"https://er.glofacts.com/api/v1/\";|const API_URL = \"${API_URL_LOCAL}\";|g" src/store/axios.tsx

yarn dev
