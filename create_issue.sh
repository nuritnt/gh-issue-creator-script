#!/bin/bash

# GitHub username and repository name
USERNAME="your_username"
REPO_NAME="your_repository"

# Path to the file containing issue titles and bodies
ISSUE_FILE="issues.txt"

# Counter for the number of created issues
ISSUE_COUNT=0

# Check if the issue file exists
if [ -f "$ISSUE_FILE" ]; then
    # Read each line from the issue file and create issues
    while IFS= read -r line
    do
        ISSUE_TITLE=$(echo "$line" | cut -d',' -f1)
        ISSUE_BODY=$(echo "$line" | cut -d',' -f2)

        # Create a new issue in the specified repository
        gh issue create --repo $USERNAME/$REPO_NAME --title "$ISSUE_TITLE" --body "$ISSUE_BODY"

        echo "Issue created: $ISSUE_TITLE"

        # Increment the issue count
        ((ISSUE_COUNT++))
    done < "$ISSUE_FILE"

    echo "Total issues created: $ISSUE_COUNT"
else
    echo "Issue file not found: $ISSUE_FILE"
fi
