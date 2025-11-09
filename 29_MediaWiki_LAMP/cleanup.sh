#!/bin/bash

# Simple cleanup script
echo "Cleaning up MediaWiki LAMP container..."

# Stop and remove container if running
docker stop mediawiki-container 2>/dev/null
docker rm mediawiki-container 2>/dev/null

# Remove image
docker rmi mediawiki-lamp 2>/dev/null

echo "Cleanup complete!"
