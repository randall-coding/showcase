#!/bin/bash

# Variables
REMOTE_HOST="167.71.191.78"
REMOTE_USER="deploy"
APP_DIR="/home/deploy/app"

# Function to execute SSH command
execute_ssh() {
    echo "ssh command: $1"
    ssh -t -o StrictHostKeyChecking=no "$REMOTE_USER@$REMOTE_HOST" "cd $APP_DIR; $1"
    if [ $? -ne 0 ]; then
        echo "Error executing command: $1"
        exit 1
    fi
}

opt_execute_ssh() {
    echo "(optional) ssh command: $1"
    ssh -t -o StrictHostKeyChecking=no "$REMOTE_USER@$REMOTE_HOST" "cd $APP_DIR; $1"
}

# Clear cache
opt_execute_ssh "docker-compose exec web rails tmp:clear"

# Stop the previous docker-compose
execute_ssh "docker-compose down"

# Pull the latest code from the git repo
execute_ssh "source ~/.start_ssh && git fetch origin && git reset --hard origin/master && git pull origin master"

# Build using docker-compose
execute_ssh "docker-compose build"

# Start the services using docker-compose
execute_ssh "docker-compose up -d"

# Start the services using docker-compose
execute_ssh "sleep 2 && docker-compose ps"

echo ""
echo "********Deployment complete!********"