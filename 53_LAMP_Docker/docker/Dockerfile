# Dockerfile for Custom LAMP Stack (Optional Alternative)

FROM mattrayner/lamp:latest

# Set working directory
WORKDIR /app

# Copy web application files
COPY webapp/ /app/

# Set proper permissions
RUN chown -R www-data:www-data /app
RUN chmod -R 755 /app

# Set MySQL root password
ENV MYSQL_ROOT_PASSWORD=rootpass

# Expose ports
EXPOSE 80 3306

# Start services
CMD ["/run.sh"]
