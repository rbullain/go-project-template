FROM golang:1.23-bookworm AS builder

RUN apt update &&  \
    apt install git -y

FROM builder AS dev

RUN go install github.com/air-verse/air@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest

WORKDIR /app

CMD ["air", "-c", "scripts/.air.toml"]
