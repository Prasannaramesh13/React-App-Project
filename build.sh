#!/bin/bash

# Accept BRANCH_NAME as argument
BRANCH_NAME=$(basename "$1")

echo "Raw input branch: $1"
echo "Normalized branch: $BRANCH_NAME"

# Define image name based on branch
if [ "$BRANCH_NAME" == "main" ]; then
    IMAGE_NAME="prasanna1808/prod:latest"
else
    IMAGE_NAME="prasanna1808/dev:latest"
fi

echo "Building image with tag: $IMAGE_NAME"

# Build the image
docker build -t $IMAGE_NAME .
