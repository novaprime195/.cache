FROM php:8.1-apache

# Install required packages
RUN apt-get update && apt-get install -y \
    mariadb-server \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions required by MediaWiki
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Download and install MediaWiki
RUN cd /tmp && \
    wget https://releases.wikimedia.org/mediawiki/1.39/mediawiki-1.39.8.tar.gz && \
    tar -xzf mediawiki-1.39.8.tar.gz && \
    mv mediawiki-1.39.8/* /var/www/html/ && \
    rm -rf /tmp/mediawiki-* && \
    chown -R www-data:www-data /var/www/html

# Create startup script
RUN echo '#!/bin/bash\n\
service mariadb start\n\
mysql -e "CREATE DATABASE IF NOT EXISTS mediawiki;"\n\
mysql -e "CREATE USER IF NOT EXISTS \"wiki\"@\"localhost\" IDENTIFIED BY \"password\";"\n\
mysql -e "GRANT ALL PRIVILEGES ON mediawiki.* TO \"wiki\"@\"localhost\";"\n\
mysql -e "FLUSH PRIVILEGES;"\n\
apache2-foreground' > /start.sh && chmod +x /start.sh

# Expose port 80
EXPOSE 80

# Start services
CMD ["/start.sh"]
