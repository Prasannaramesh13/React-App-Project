#!/bin/bash

echo "Deploying to server..."

# Accept BRANCH_NAME as an argument
BRANCH_NAME=$1

# Set image and container name based on branch
if [ "$BRANCH_NAME" == "dev" ] || [ "$BRANCH_NAME" == "dev" ]; then
    IMAGE="prasanna1808/dev:latest"
    CONTAINER_NAME="app-dev"
else
    IMAGE="prasanna1808/prod:latest"
    CONTAINER_NAME="app-prod"
fi

# Connect to EC2 and deploy
ssh -i AWS.pem ubuntu@<EC2_PUBLIC_IP> << EOF
    docker pull $IMAGE
    docker stop $CONTAINER_NAME || true
    docker rm $CONTAINER_NAME || true
    docker run -d --name $CONTAINER_NAME -p 80:3000 $IMAGE
EOF