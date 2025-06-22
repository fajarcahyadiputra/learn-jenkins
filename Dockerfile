FROM alpine

WORKDIR /app

RUN apk add --no-cache ca-certificates

COPY --from=builder /app/myapp .

# Tambahkan ini untuk memastikan permission
RUN chmod +x ./myapp

EXPOSE 5000
CMD ["./myapp"]
