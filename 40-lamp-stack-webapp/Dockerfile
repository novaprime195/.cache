# Use official LAMP stack image
FROM mattrayner/lamp:latest-1804

# Maintainer info
LABEL maintainer="your-email@example.com"
LABEL description="LAMP Stack Todo Application"

# Copy application files to web root
COPY app/ /app

# Set proper permissions
RUN chown -R www-data:www-data /app

# Expose port 80 for web traffic
EXPOSE 80

# Start Apache and MySQL
CMD ["/run.sh"]
