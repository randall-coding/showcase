#!/bin/bash

# Variables
REMOTE_HOST="167.71.191.78"
REMOTE_USER="deploy"
APP_DIR="/home/deploy/app"

# Function to execute SSH command
execute_ssh() {
    echo "ssh command: $1"
    ssh -t -o StrictHostKeyChecking=no "$REMOTE_USER@$REMOTE_HOST" "cd $APP_DIR; $1; exit 0"
    if [ $? -ne 0 ]; then
        echo "Error executing command: $1"
        exit 1
    fi
}

# Stop the previous docker-compose
execute_ssh "docker-compose down"

# Pull the latest code from the git repo
execute_ssh "git pull origin master"

# Build using docker-compose
execute_ssh "docker-compose build"

# Start the services using docker-compose
execute_ssh "docker-compose up -d"

echo "Deployment complete!"