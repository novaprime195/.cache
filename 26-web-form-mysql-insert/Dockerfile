FROM php:8.2-apache

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Copy application files
COPY index.html /var/www/html/
COPY insert.php /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80
