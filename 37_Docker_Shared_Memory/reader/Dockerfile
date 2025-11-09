FROM python:3.9-slim

WORKDIR /app

COPY reader.py .

# Create shared directory
RUN mkdir -p /shared

CMD ["python", "reader.py"]
