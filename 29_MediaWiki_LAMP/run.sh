#!/bin/bash

# Build and run MediaWiki LAMP container
echo "Building MediaWiki LAMP container..."
docker build -t mediawiki-lamp .

echo "Running container on port 8080..."
docker run -d -p 8080:80 --name mediawiki-container mediawiki-lamp

echo ""
echo "MediaWiki LAMP stack is starting..."
echo "Wait 30 seconds, then visit: http://localhost:8080"
echo ""
echo "To stop: docker stop mediawiki-container"
echo "To remove: docker rm mediawiki-container"
