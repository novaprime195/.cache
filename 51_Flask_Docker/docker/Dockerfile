# Dockerfile for Flask Hello World Application
# Experiment 51 - Flask Docker Demo

# Use official Python runtime as base image
FROM python:3.9-slim

# Set working directory in container
WORKDIR /app

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000
ENV PYTHONUNBUFFERED=1

# Copy requirements first for better caching
COPY app/requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/app.py .

# Create non-root user for security
RUN groupadd -r flaskgroup && useradd -r -g flaskgroup flaskuser
RUN chown -R flaskuser:flaskgroup /app
USER flaskuser

# Expose port 5000
EXPOSE 5000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000/health || exit 1

# Labels for image metadata
LABEL maintainer="OSS Lab Experiment 51"
LABEL description="Simple Flask Hello World Application"
LABEL version="1.0.0"

# Run the application
CMD ["python", "app.py"]
