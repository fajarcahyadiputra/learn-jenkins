# Build stage
FROM golang:1.23-alpine AS builder

WORKDIR /app

# Install git (if go get needs it), and build tools
RUN apk add --no-cache git

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

# Build binary statically
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o myapp main.go

# Run stage
FROM alpine

WORKDIR /app
COPY --from=builder /app/myapp .

EXPOSE 5000
CMD ["./myapp"]
