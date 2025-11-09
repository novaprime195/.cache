FROM python:3.9-slim

WORKDIR /app

COPY writer.py .

# Create shared directory
RUN mkdir -p /shared

CMD ["python", "writer.py"]
