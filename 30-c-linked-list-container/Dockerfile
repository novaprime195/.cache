# Use lightweight Alpine Linux with GCC
FROM gcc:alpine

# Set working directory
WORKDIR /app

# Copy source code
COPY linked_list.c .

# Compile the program
RUN gcc -o linked_list linked_list.c

# Run the program
CMD ["./linked_list"]
