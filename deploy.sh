#!/bin/bash

echo "Deploying to server..."

# Accept BRANCH_NAME as an argument
BRANCH_NAME=$(basename "$1")
echo "Raw input branch: $1"
echo "Normalized branch: $BRANCH_NAME"
# Set image and container name based on branch
if [ "$BRANCH_NAME" == "main" ]; then
    IMAGE="prasanna1808/prod:latest"
    CONTAINER_NAME="app-prod"
else
    IMAGE="prasanna1808/dev:latest"
    CONTAINER_NAME="app-dev"
fi

# Connect to EC2 and deploy
ssh -o StrictHostKeyChecking=no ubuntu@52.71.59.200 << EOF
    docker pull $IMAGE
    docker stop $CONTAINER_NAME || true
    docker rm $CONTAINER_NAME || true
    docker run -d --name $CONTAINER_NAME -p 80:3000 $IMAGE
EOF
