FROM ubuntu:22.04

# Install OpenJDK
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Java source file
COPY HelloWorld.java .

# Compile Java application
RUN javac HelloWorld.java

# Run the Java application
CMD ["java", "HelloWorld"]
