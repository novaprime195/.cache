# Simple Bug Tracking Tool - Using lightweight issue tracker
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Flask and other dependencies
RUN pip install --no-cache-dir flask flask-sqlalchemy

# Copy application files
COPY app.py /app/
COPY templates /app/templates/
COPY static /app/static/

# Create database directory
RUN mkdir -p /app/data

# Expose port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Run the application
CMD ["python", "app.py"]
