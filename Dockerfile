# Build stage
FROM golang:1.23 AS builder

WORKDIR /app
COPY . .
RUN go build -o myapp

# Run stage
FROM alpine
WORKDIR /app
COPY --from=builder /app/myapp .
EXPOSE 5000
CMD ["./myapp"]
