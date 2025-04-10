#!/bin/bash

# Accept BRANCH_NAME as argument
BRANCH_NAME=$1

echo "Building Docker image for branch: $BRANCH_NAME"

# Define image name based on branch
if [ "$BRANCH_NAME" == "dev" ] || [ "$BRANCH_NAME" == "dev" ]; then
    IMAGE_NAME="prasanna1808/dev:latest"
else
    IMAGE_NAME="prasanna1808/prod:latest"
fi

# Build and push image
docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME