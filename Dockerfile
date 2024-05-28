# Start from a Debian image with the latest version of Go installed
FROM golang:1.22-bullseye as builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN go build -o main cmd/app/main.go

# Start a new stage from scratch
FROM debian:bullseye-slim

WORKDIR /app

# Copy the binary from builder stage
COPY --from=builder /app/main /app/main

# Expose port 4000 to the outside world
EXPOSE 4000

# Command to run the executable
ENTRYPOINT ["./main"]