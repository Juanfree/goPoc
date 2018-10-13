FROM golang:alpine3.7 AS builder

WORKDIR /go/src

RUN apk update && apk add git make

RUN go get github.com/siddontang/go-mysql-elasticsearch; exit 0

WORKDIR github.com/siddontang/go-mysql-elasticsearch

RUN make

WORKDIR bin

FROM alpine:latest AS prod

WORKDIR /opt/go-mysql-elasticsearch

COPY --from=builder /go/src/github.com/siddontang/go-mysql-elasticsearch/bin/go-mysql-elasticsearch .

ADD mysql_to_elastic/docker/rootfs /

ENTRYPOINT ./go-mysql-elasticsearch -config=config/config.toml
