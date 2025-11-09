# Dockerfile demonstrating all common fields

# FROM: Base image (using Ubuntu as the distro)
FROM ubuntu:22.04

# LABEL: Metadata for the image
LABEL maintainer="user@example.com"
LABEL version="1.0"
LABEL description="Demo container showing all Dockerfile fields"

# ARG: Build-time variables
ARG APP_DIR=/app
ARG DEBIAN_FRONTEND=noninteractive

# ENV: Environment variables
ENV APP_HOME=${APP_DIR}
ENV PATH="${APP_HOME}/bin:${PATH}"
ENV LANG=C.UTF-8

# WORKDIR: Set working directory
WORKDIR ${APP_HOME}

# RUN: Execute commands during build
RUN apt-get update && \
    apt-get install -y \
    curl \
    vim \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# COPY: Copy files from host to container
COPY app.py .
COPY requirements.txt .

# ADD: Similar to COPY (can also extract archives and use URLs)
ADD config.tar.gz /etc/myapp/

# RUN: Install Python dependencies
RUN pip3 install -r requirements.txt

# EXPOSE: Document which ports the container listens on
EXPOSE 8080
EXPOSE 8443

# VOLUME: Create mount point for persistent data
VOLUME ["/data"]

# USER: Switch to non-root user
RUN useradd -m -u 1000 appuser
USER appuser

# HEALTHCHECK: Define container health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# ENTRYPOINT: Default executable (won't be overridden)
ENTRYPOINT ["python3"]

# CMD: Default arguments (can be overridden)
CMD ["app.py"]
