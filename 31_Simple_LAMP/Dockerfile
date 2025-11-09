# Simple LAMP Stack Dockerfile
FROM ubuntu:22.04

# Avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install LAMP stack components
RUN apt-get update && apt-get install -y \
    apache2 \
    mysql-server \
    php \
    php-mysql \
    && rm -rf /var/lib/apt/lists/*

# Copy web application files
COPY webapp/ /var/www/html/

# Set up MySQL database
RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS simple_app;" && \
    mysql -e "CREATE USER IF NOT EXISTS 'webuser'@'localhost' IDENTIFIED BY 'password';" && \
    mysql -e "GRANT ALL PRIVILEGES ON simple_app.* TO 'webuser'@'localhost';" && \
    mysql -e "FLUSH PRIVILEGES;"

# Create startup script
RUN echo '#!/bin/bash\n\
service mysql start\n\
apache2ctl -D FOREGROUND' > /start.sh && \
    chmod +x /start.sh

# Expose port 80
EXPOSE 80

# Start services
CMD ["/start.sh"]
