#!/bin/bash

# Example script for deploying an application to CapRover directly from the command line

set -e

APP_NAME="myapp"
APP_TOKEN="YOUR_APP_TOKEN"
CAPROVER_URL="https://caprover.yourdomain.com"

# Create a tar file with the updated files
echo "Creating deploy.tar..."

tar -cf deploy.tar \
  --exclude='deploy.tar' \
  --exclude='.env' \
  webserver/ \
  public_html/ \
  Dockerfile

# Print file size and deploy with CapRover
file_size=$(du -h deploy.tar | cut -f1)

echo "Deploying $file_size to $APP_NAME..."

caprover deploy --tarFile deploy.tar \
   --appName "$APP_NAME" \
   --appToken "$APP_TOKEN" \
   --caproverUrl "$CAPROVER_URL"

# Remove the tar file
rm deploy.tar