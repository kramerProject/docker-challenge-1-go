FROM golang:1.17.8-alpine AS builder 
WORKDIR /app
COPY . .
RUN go mod init app 
RUN go build index.go

FROM hello-world:linux
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["./index"]