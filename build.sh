#!/bin/bash

# Accept BRANCH_NAME as argument
BRANCH_NAME=$1

echo "Building Docker image for branch: $BRANCH_NAME"

# Define image name based on branch
if [ "$BRANCH_NAME" == "main" ] || [ "$BRANCH_NAME" == "prod" ]; then
    IMAGE_NAME="prasanna1808/prod:latest"
else
    IMAGE_NAME="prasanna1808/dev:latest"
fi

# Build and push image
docker build -t $IMAGE_NAME .
