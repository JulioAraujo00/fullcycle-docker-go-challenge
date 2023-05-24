FROM golang:1.17-alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 go build -ldflags "-s -w" -o fullcycle-go

RUN apk add --no-cache build-base

RUN apk add --no-cache upx

RUN upx --brute fullcycle-go

FROM scratch

WORKDIR /app

COPY --from=builder /app/fullcycle-go .

EXPOSE 8080

CMD ["./fullcycle-go"]
