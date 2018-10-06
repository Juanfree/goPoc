FROM golang:latest

ADD src /go/src

RUN go get github.com/revel/cmd/revel

EXPOSE 9000

ENTRYPOINT revel run tblox
