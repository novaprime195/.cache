FROM php:8.0-apache

# Install MySQL extension
RUN docker-php-ext-install pdo pdo_mysql

# Copy web files
COPY index.html /var/www/html/
COPY login.php /var/www/html/

# Enable Apache rewrite
RUN a2enmod rewrite

EXPOSE 80
